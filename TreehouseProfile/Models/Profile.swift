//
//  Profile.swift
//  TreehouseProfile
//
//  Created by Addison Francisco on 11/25/17.
//  Copyright © 2017 Addison Francisco. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
	
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case profileName = "profile_name"
		case profileURL = "profile_url"
		case gravatarURL = "gravatar_url"
		case badges = "badges"
		case points = "points"
	}
	
	let name: String?
	let profileName: String?
	let profileURL: String?
	let gravatarURL: String?
	let badges: [Badge]?
	let points: [String: Int]?
}

struct Badge: Codable {
	
	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case url = "url"
		case iconURL = "icon_url"
		case earnedDate = "earned_date"
		case courses = "courses"
	}
	
	let id: Int // There should always be an ID
	let name: String?
	let url: String?
	let iconURL: String?
	let earnedDate: String?
	let courses: [Course]?
}

struct Course: Codable {
	
	enum CodingKeys: String, CodingKey {
		case title = "title"
		case url = "url"
		case badgeCount = "badge_count"
	}
	
	let title: String?
	let url: String?
	let badgeCount: Int?
}
