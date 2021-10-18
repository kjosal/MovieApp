//
//  FavoriteView.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit
import CoreData

class FavoriteView: UIViewController, FavoriteControllerToView {
    var controller: FavoriteViewToController?
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
    }
    
    func setupNavigation() {
        navBarWithBackComponent(title: F.title.rawValue)
    }
    
    func setupView() {
        registerTableView()
    }
    
    func registerTableView(){
        favoriteTableView.register(SimpleMovieTableViewCell.nib, forCellReuseIdentifier: SimpleMovieTableViewCell.cellName)
        
        favoriteTableView.delegate    = self
        favoriteTableView.dataSource  = self
        
        favoriteTableView.estimatedRowHeight   = UITableView.automaticDimension
        favoriteTableView.rowHeight            = UITableView.automaticDimension
        
        favoriteTableView.tableFooterView = UIView()
    }
    
    func refreshTableView() {
        favoriteTableView.reloadData()
    }
}

//MARK: TableView
extension FavoriteView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = controller?.list?[indexPath.row]
        
        let simpleMovieData = SimpleMovieDataModel(
            movieId: data?.value(forKey: EntityFavorite.id.name) as? Int ?? 0,
            movieImage: data?.value(forKey: EntityFavorite.image.name) as? String ?? "",
            movieTitle: data?.value(forKey: EntityFavorite.title.name) as? String ?? "",
            movieReleaseDate: data?.value(forKey: EntityFavorite.releaseDate.name) as? String ?? "",
            movieOverview: data?.value(forKey: EntityFavorite.overview.name) as? String ?? "")
        return getSimpleMovieCell(tableView: tableView, data: simpleMovieData)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.tableViewSelected(for: indexPath)
    }
}

//MARK: TableView Cell
extension FavoriteView {
    func getSimpleMovieCell(tableView: UITableView, data: SimpleMovieDataModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleMovieTableViewCell.cellName) as! SimpleMovieTableViewCell
        cell.setupCell(data: data)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: Change View
extension FavoriteView {
    func navigateToAnotherView(with vc: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
