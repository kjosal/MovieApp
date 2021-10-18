//
//  FavoriteProtocol.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit
import CoreData

protocol FavoriteControllerToView: class {
    var controller: FavoriteViewToController? {get set}
    
    func setupNavigation()
    func setupView()
    func refreshTableView()
    
    func navigateToAnotherView(with vc: UIViewController)
}

protocol FavoriteViewToController: class {
    var view: FavoriteControllerToView? {get set}
    var list: [NSManagedObject]? {get set}
    
    func viewDidLoad()
    func tableViewSelected(for index: IndexPath)
}
