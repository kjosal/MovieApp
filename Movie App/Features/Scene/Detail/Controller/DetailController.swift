//
//  DetailController.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation
import CoreData

class DetailController: DetailViewToController {
    var view            : DetailControllerToView?
    var model           : DetailControllerToModel?
    var previousPage    : RefreshPreviousPageControllerToController?
    var id              : Int?
    var title           : String?
    var data            : MovieDetailResponse?
    var isFavorite      : Bool = false
    
    var localDB         : LocalDatabaseFavorite?
    
    func viewDidLoad() {
        view?.setupNavigation(title: title ?? "")
        
        localDB     = LocalDatabaseFavorite.init()
        isFavorite  = localDB?.isFavoriteMovieExist(id: id ?? 0) ?? false
        
        view?.firstView()
        requestMovieDetail()
    }
    
    func getIsFavorite() -> Bool{
        return isFavorite
    }
}

//MARK: Request Data (API)
extension DetailController {
    func requestMovieDetail(){
        model?.requestMovieDetail(id: id ?? 0)
    }
}

//MARK: Retrieve Data
extension DetailController: DetailModelToController {
    func didGetMovieDetail(response: MovieDetailResponse) {
        data = response
        view?.setupView(url: response.backdropPath, title: response.title, active: isFavorite, releaseDate: response.releaseDate, overview: response.overview)
    }
}

//MARK: Pressed Action
extension DetailController {
    func backButtonPressed() {
        previousPage?.refreshData()
    }
    
    func favoriteIconPressed() {
        if(isFavorite){
            localDB?.deleteFavoriteMovie(id: data?.id ?? 0)
        }
        else {
            localDB?.addFavoriteMovie(
                id: data?.id ?? 0,
                image: data?.backdropPath ?? "",
                title: data?.title ?? "",
                releaseDate: data?.releaseDate ?? "",
                overview: data?.overview ?? "")
        }

        isFavorite = !isFavorite
        view?.changeFavoriteIcon(active: isFavorite)
    }
    
    func reviewButtonPressed() {
        fromDetailToReviewView()
    }
}

//MARK: Change View
extension DetailController {
    func fromDetailToReviewView(){
        let reviewConfig = ReviewConfigurator()
        let vc = ReviewConfigurator.createReviewView(reviewConfig)
        view?.navigateToAnotherView(with: vc(id ?? 0))
    }
}
