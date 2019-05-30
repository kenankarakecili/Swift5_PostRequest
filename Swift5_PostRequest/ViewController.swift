//
//  ViewController.swift
//  Swift5_PostRequest
//
//  Created by kenankarakecili on 30/5/19.
//  Copyright © 2019 kenankarakecili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func onBtnSendMessage(_ sender: UIButton) {
		let message = Message(message: "mymessage")
		let postRequest = APIRequest(endpoint: "messages")
		postRequest.save(message) { (result) in
			switch result {
			case .success(let message):
				print("The following message has been sent: \(message)")
			case .failure(let err):
				print("An error occured: \(err.localizedDescription)")
			}
		}
	}
	
}

