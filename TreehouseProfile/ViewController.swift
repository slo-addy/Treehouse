//
//  ViewController.swift
//  TreehouseProfile
//
//  Created by Addison Francisco on 10/18/17.
//  Copyright © 2017 Addison Francisco. All rights reserved.
//

import UIKit

struct Profile: Codable {
	let name: String?
	let profile_name: String?
	let profile_url: String?
	let gravatar_url: String?
	let badges: [Badges]?
	let points: [String: Int]?
}

struct Badges: Codable {
	let id: Int // There should always be an ID
	let name: String?
	let url: String?
	let icon_url: String?
	let earned_date: String?
	let courses: [Courses]?
}

struct Courses: Codable {
	let title: String?
	let url: String?
	let badge_count: Int?
}

class ViewController: UIViewController {
	
	var didGetData: Bool = false
	
	@IBOutlet weak var buttonSubTextLabel: UILabel!
	
	@IBAction func doItButton(_ sender: UIButton) {
		if !didGetData {
			fetchData() { () in
				didGetData = true
				buttonSubTextLabel.isHidden = false
				sender.isEnabled = false
				print("Did the thing: \(didGetData)")
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		buttonSubTextLabel.isHidden = true
	}
	
	func fetchData(completion: () -> Void) {
		let jsonURLString = "https://teamtreehouse.com/addisonfrancisco.json"
		guard let url = URL(string: jsonURLString) else { return }
		
		URLSession.shared.dataTask(with: url) {(data, response, err) in
			guard let myData = data else { return }
			
			do {
				let profileFromJSON = try JSONDecoder().decode(Profile.self, from: myData)
				//				let profileFromJSON = try JSONSerialization.jsonObject(with: myData, options: [])
				if let badges = profileFromJSON.badges {
					print(badges)
				}
			}
			catch let jsonErr {
				print("Error serializing json", jsonErr)
			}
		}.resume()
	completion()
	}
}

