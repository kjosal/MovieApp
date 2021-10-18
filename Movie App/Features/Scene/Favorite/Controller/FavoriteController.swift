//
//  FavoriteController.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation
import CoreData

class FavoriteController: FavoriteViewToController {
    var view    : FavoriteControllerToView?
    var list    : [NSManagedObject]?
    var localDB : LocalDatabaseFavorite?
    
    func viewDidLoad() {
        view?.setupNavigation()
        view?.setupView()
        
        localDB = LocalDatabaseFavorite()
        list    = localDB?.getListFavoriteMovie()
    }
    
    func tableViewSelected(for index: IndexPath) {
        let data = list?[index.row]
        fromFavoriteToDetailView(
            id: data?.value(forKey: EntityFavorite.id.name) as? Int ?? 0,
            title: data?.value(forKey: EntityFavorite.title.name) as? String ?? "")
    }

}

//MARK: Refresh Page
extension FavoriteController: RefreshPreviousPageControllerToController {
    func refreshData() {
        list = localDB?.getListFavoriteMovie()
        view?.refreshTableView()
    }
}

//MARK: Change View
extension FavoriteController {
    func fromFavoriteToDetailView(id: Int, title: String){
        let detailConfig = DetailConfigurator()
        let vc = DetailConfigurator.createDetailView(detailConfig)
        view?.navigateToAnotherView(with: vc(self, id, title))
    }
}
