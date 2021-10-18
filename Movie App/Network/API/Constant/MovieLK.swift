//
//  MovieLK.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

typealias MAPI      = MovieLK.MovieAPI
typealias APIMETHOD = MovieLK.HttpMethod
typealias Endpoint  = MovieLK.Endpoint
typealias Category  = MovieLK.Category

public struct MovieLK {
    enum MovieAPI: String {
        case baseLink       = "https://api.themoviedb.org/3/movie/"
        case apiKey         = "?api_key=c11b37bbec11aded5032c688e0370989"
        case page           = "&page="
        case backdropPath   = "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/"
    }
    
    enum HttpMethod: String {
        case post       = "POST"
        case get        = "GET"
        case put        = "PUT"
        case delete     = "DELETE"
    }
    
    enum Endpoint: String {
        case reviews    = "/reviews"
    }
    
    enum Category: String {
        case popular
        case upcoming
        case topRated
        case nowPlaying
        
        var endpoint: String{
            switch self {
            case .popular:
                return "popular"
            case .upcoming:
                return "upcoming"
            case .topRated:
                return "top_rated"
            case .nowPlaying:
                return "now_playing"
            }
        }
        
        var title: String{
            switch self {
            case .popular:
                return "Popular"
            case .upcoming:
                return "Upcoming"
            case .topRated:
                return "Top Rated"
            case .nowPlaying:
                return "Now Playing"
            }
        }
    }
}
