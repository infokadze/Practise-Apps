//
//  User.swift
//  GHFollowers
//
//  Created by Harry Crocks on 09.06.2021.
//

import UIKit

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
