//
//  HomeController.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import Foundation

class HomeController: HomeViewToController {
    var view        : HomeControllerToView?
    var model       : HomeControllerToModel?
    var list        : MovieData?
    var isLoading   : Bool?
    
    var totalPage   : Int = 1
    var currentPage : Int = 1
    
    func viewDidLoad() {
        view?.setupNavigation()
        view?.setupView()
        
        //first setup
        list = MovieData()
        requestMovieData()
    }
    
    func favoriteIconPressed() {
        fromHomeToFavoriteView()
    }
    
    func loadMoreData() {
        if((currentPage < totalPage) && !(isLoading ?? false)){
            isLoading   = true
            currentPage += 1
            
            DispatchQueue.global().async {
                // Download more data
                self.requestMovieData()
                
                DispatchQueue.main.async {
                    self.view?.refreshTableView()
                    self.isLoading = false
                }
            }
        }
    }
    
    func tableViewSelected(for index: IndexPath) {
        let data = list?.data[index.row]
        fromHomeToDetailView(id: data?.id ?? 0, title: data?.title ?? "")
    }
}

//MARK: Request Data
extension HomeController {
    func requestMovieData(){
        model?.requestMovieData(endpoint: list?.category.endpoint ?? "", page: currentPage)
    }
}

//MARK: Retrieve Data
extension HomeController: HomeModelToController {
    func didGetMovieData(response: MovieResponse) {
        totalPage = response.totalPages
        list?.addData(data: response.results)
        view?.refreshTableView()
    }
}

//MARK: Action Sheet Pressed
extension HomeController {
    func actionSheetPressed(category: Category) {
        currentPage = 1
        totalPage   = 1
        
        list?.clearData()
        view?.refreshTableView()
        
        list?.category = category
        requestMovieData()
    }
}

//MARK: Change View
extension HomeController {
    func fromHomeToFavoriteView(){
        let favoriteConfig = FavoriteConfigurator()
        let vc = FavoriteConfigurator.createFavoriteView(favoriteConfig)
        view?.navigateToAnotherView(with: vc())
    }
    
    func fromHomeToDetailView(id: Int, title: String){
        let detailConfig = DetailConfigurator()
        let vc = DetailConfigurator.createDetailView(detailConfig)
        view?.navigateToAnotherView(with: vc(nil, id, title))
    }
}
