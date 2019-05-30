//
//  File.swift
//  Swift5_PostRequest
//
//  Created by kenankarakecili on 30/5/19.
//  Copyright © 2019 kenankarakecili. All rights reserved.
//

import Foundation

final class Message: Codable {
	var id: Int?
	var message: String
	
	init(message: String) {
		self.message = message
	}
}
