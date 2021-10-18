//
//  SimpleMovieReviewDataModel.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public struct SimpleMovieReviewDataModel {
    var author  : String
    var review  : String
    
    public init(author: String, review: String){
        self.author = author
        self.review = review
    }
}
