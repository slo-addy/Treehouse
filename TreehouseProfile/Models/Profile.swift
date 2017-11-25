//
//  Profile.swift
//  TreehouseProfile
//
//  Created by Addison Francisco on 11/25/17.
//  Copyright © 2017 Addison Francisco. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
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
