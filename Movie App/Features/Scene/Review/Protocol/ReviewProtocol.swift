//
//  ReviewProtocol.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

protocol ReviewControllerToView: class {
    var controller: ReviewViewToController? {get set}
    
    func setupNavigation()
    func setupView()
    func refreshTableView()
}

protocol ReviewControllerToModel: class {
    var controller: ReviewModelToController? {get set}
    
    func requestReviewData(id: Int, page: Int)
}

protocol ReviewViewToController: class {
    var view: ReviewControllerToView? {get set}
    var model: ReviewControllerToModel? {get set}
    var id: Int? {get set}
    var list: ReviewData? {get set}
    var isLoading: Bool? {get set}
    
    func viewDidLoad()
    func loadMoreData()
}

protocol ReviewModelToController: class {
    func didGetReviewData(response: MovieReviewResponse)
}
