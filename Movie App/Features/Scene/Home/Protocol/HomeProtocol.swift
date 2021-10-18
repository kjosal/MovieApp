//
//  HomeProtocol.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

import UIKit

protocol HomeControllerToView: class {
    var controller: HomeViewToController? {get set}
    
    func setupNavigation()
    func setupView()
    func refreshTableView()
    
    func navigateToAnotherView(with vc: UIViewController)
}

protocol HomeControllerToModel: class {
    var controller: HomeModelToController? {get set}
    
    func requestMovieData(endpoint: String, page: Int)
}

protocol HomeViewToController: class {
    var view: HomeControllerToView? {get set}
    var model: HomeControllerToModel? {get set}
    var list: MovieData? {get set}
    var isLoading: Bool? {get set}
    
    func viewDidLoad()
    
    func favoriteIconPressed()
    func loadMoreData()
    func tableViewSelected(for index: IndexPath)
    func actionSheetPressed(category: Category)
}

protocol HomeModelToController: class {
    func didGetMovieData(response: MovieResponse)
}
