//
//  ReviewModel.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

public class ReviewModel: ReviewControllerToModel {
    var controller: ReviewModelToController?
    
    func requestReviewData(id: Int, page: Int) {
        let requestMovieReview = APIGetMovieReview(id: id, page: page)
        requestMovieReview.requestMovieReview(completionHandler: { result in
            DispatchQueue.main.async {
                self.controller?.didGetReviewData(response: result)
            }
        })
    }
}
