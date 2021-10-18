//
//  ReviewController.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

class ReviewController: ReviewViewToController {
    var view        : ReviewControllerToView?
    var model       : ReviewControllerToModel?
    var id          : Int?
    var list        : ReviewData?
    var isLoading   : Bool?
    
    var totalPage   : Int = 1
    var currentPage : Int = 1
    
    func viewDidLoad() {
        view?.setupNavigation()
        view?.setupView()
        
        //first setup
        list = ReviewData()
        requestMovieReviewData()
    }
    
    func loadMoreData() {
        if((currentPage < totalPage) && !(isLoading ?? false)){
            isLoading   = true
            currentPage += 1
            
            DispatchQueue.global().async {
                // Download more data
                self.requestMovieReviewData()
                
                DispatchQueue.main.async {
                    self.view?.refreshTableView()
                    self.isLoading = false
                }
            }
        }
    }
}

//MARK: Request Data
extension ReviewController {
    func requestMovieReviewData(){
        model?.requestReviewData(id: id ?? 0, page: currentPage)
    }
}

//MARK: Retrieve Data
extension ReviewController: ReviewModelToController {
    func didGetReviewData(response: MovieReviewResponse) {
        totalPage = response.totalPages
        list?.addData(data: response.results)
        view?.refreshTableView()
    }
}
