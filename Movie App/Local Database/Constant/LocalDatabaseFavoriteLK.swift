//
//  LocalDatabaseFavoriteLK.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

typealias LDF = LocalDatabaseFavoriteLK.Favorite
typealias EntityFavorite = LocalDatabaseFavoriteLK.Entity

public struct LocalDatabaseFavoriteLK {
    enum Favorite: String {
        case entityName = "Favorite"
    }
    
    enum Entity {
        case id
        case image
        case title
        case releaseDate
        case overview
        
        var name: String {
            switch self {
            case .id:
                return "id"
            case .image:
                return "image"
            case .title:
                return "title"
            case .releaseDate:
                return "release_date"
            case .overview:
                return "overview"
            }
        }
    }
}
