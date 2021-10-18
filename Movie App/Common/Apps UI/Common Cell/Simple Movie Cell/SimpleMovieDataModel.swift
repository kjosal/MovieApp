//
//  SimpleMovieDataModel.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public struct SimpleMovieDataModel {
    var movieId             : Int
    var movieImage          : String
    var movieTitle          : String
    var movieReleaseDate    : String
    var movieOverview       : String
    
    public init(movieId: Int, movieImage: String, movieTitle: String, movieReleaseDate: String, movieOverview: String){
        self.movieId            = movieId
        self.movieImage         = movieImage
        self.movieTitle         = movieTitle
        self.movieReleaseDate   = movieReleaseDate
        self.movieOverview      = movieOverview
    }
}
