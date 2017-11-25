//
//  ProfileDataFetcher.swift
//  TreehouseProfile
//
//  Created by Addison Francisco on 11/25/17.
//  Copyright © 2017 Addison Francisco. All rights reserved.
//

import Foundation

struct ProfileDataFetcher {
	
	func fetchData(completion: () -> Void) {
		let jsonURLString = "https://teamtreehouse.com/addisonfrancisco.json"
		guard let url = URL(string: jsonURLString) else { return }
		
		URLSession.shared.dataTask(with: url) {(data, response, err) in
			guard let myData = data else { return }
			
			do {
				let profileFromJSON = try JSONDecoder().decode(UserProfile.self, from: myData)
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
