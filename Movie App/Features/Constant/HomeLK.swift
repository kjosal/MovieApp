//
//  HomeLK.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

typealias H     = HomeLK.Home
typealias F     = HomeLK.Favorite
typealias D     = HomeLK.Detail
typealias R     = HomeLK.Review
typealias Icon  = HomeLK.Icon

public struct HomeLK {
    enum Home: String {
        case title              = "Movie App"
        case homeCategoryButton = "Category"
        case batalText          = "Batal"
    }
    
    enum Favorite: String {
        case title              = "Favorite Movie"
    }
    
    enum Detail: String {
        case backButton         = "back"
        case overviewText       = "Overview"
        case movieReviewButton  = "See Review"
    }
    
    enum Review: String {
        case title             = "Movie Review"
    }
    
    enum Icon: String {
        case favoriteFill       = "heart.fill"
        case favoriteEmpty      = "heart"
    }
}
