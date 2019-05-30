//
//  APIRequest.swift
//  Swift5_PostRequest
//
//  Created by kenankarakecili on 30/5/19.
//  Copyright © 2019 kenankarakecili. All rights reserved.
//

import Foundation

enum APIError: Error {
	case responseProblem
	case decodingProblem
	case encodingProblem
}

struct APIRequest {
	let resourceURL: URL
	
	init(endpoint: String) {
		let resourceString = ""
		guard let resourceURL = URL(string: resourceString) else { fatalError() }
		self.resourceURL = resourceURL
	}
	
	func save(_ messageToSave: Message, completion: @escaping(Result<Message, APIError>) -> Void) {
		do {
			var urlRequest = URLRequest(url: resourceURL)
			urlRequest.httpMethod = "POST"
			urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
			urlRequest.httpBody = try JSONEncoder().encode(messageToSave)
			let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, _) in
				guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
					completion(.failure(.responseProblem))
					return
				}
				do {
					let messageData = try JSONDecoder().decode(Message.self, from: jsonData)
					completion(.success(messageData))
				} catch {
					completion(.failure(.decodingProblem))
				}
			}
			dataTask.resume()
		} catch {
			completion(.failure(.encodingProblem))
		}
	}
}
