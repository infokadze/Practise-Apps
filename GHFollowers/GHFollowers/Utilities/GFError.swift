//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by Harry Crocks on 09.06.2021.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "Invalid username"
    case unableToComplete = "Unable to complete"
    case invalidResponse = "Invalid response"
    case invalidData = "Invalid data"
    case unableToFavorite = "There was an error favoriting this user"
    case alreadyInFavorites = "You already favorited this user" 
}
