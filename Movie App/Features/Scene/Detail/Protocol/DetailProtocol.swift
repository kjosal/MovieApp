//
//  DetailProtocol.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

protocol DetailControllerToView: class {
    var controller: DetailViewToController? {get set}
    
    func setupNavigation(title: String)
    func firstView()
    func setupView(url: String, title: String, active: Bool, releaseDate: String, overview: String)
    func changeFavoriteIcon(active: Bool)
    
    func navigateToAnotherView(with vc: UIViewController)
}

protocol DetailControllerToModel: class {
    var controller: DetailModelToController? {get set}
    
    func requestMovieDetail(id: Int)
}

protocol DetailViewToController: class {
    var view            : DetailControllerToView? {get set}
    var model           : DetailControllerToModel? {get set}
    var previousPage    : RefreshPreviousPageControllerToController? {get set}
    var id              : Int? {get set}
    var title           : String? {get set}
    var data            : MovieDetailResponse? {get set}
    
    func viewDidLoad()
    func backButtonPressed()
    func favoriteIconPressed()
    func reviewButtonPressed()
}

protocol DetailModelToController: class {
    func didGetMovieDetail(response: MovieDetailResponse)
}

protocol RefreshPreviousPageControllerToController: class {
    func refreshData()
}
