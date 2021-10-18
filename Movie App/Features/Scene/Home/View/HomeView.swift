//
//  HomeView.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

class HomeView: UIViewController, HomeControllerToView {
    var controller: HomeViewToController?
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeCategoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
    }
    
    func setupNavigation() {
        navBarComponent(title: H.title.rawValue)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Icon.favoriteFill.rawValue), style: .done, target: self, action: #selector(favoriteIconPressed(sender:)))
    }
    
    func setupView() {
        registerTableView()
        homeCategoryButtonComponent()
    }
    
    func registerTableView(){
        homeTableView.register(SimpleMovieTableViewCell.nib, forCellReuseIdentifier: SimpleMovieTableViewCell.cellName)
        
        homeTableView.delegate    = self
        homeTableView.dataSource  = self
        
        homeTableView.estimatedRowHeight   = UITableView.automaticDimension
        homeTableView.rowHeight            = UITableView.automaticDimension
        
        homeTableView.tableFooterView = UIView()
    }
    
    func refreshTableView() {
        homeTableView.reloadData()
    }
}

//MARK: Component Attribute
extension HomeView {
    func homeCategoryButtonComponent(){
        homeCategoryButton.setTitle(H.homeCategoryButton.rawValue, for: .normal)
        homeCategoryButton.titleLabel?.font     = UIFont.boldSystemFont(ofSize: 16)
        homeCategoryButton.tintColor            = .white
        homeCategoryButton.backgroundColor      = .systemBlue
    }
}

//MARK: Pressed Action
extension HomeView {
    @objc func favoriteIconPressed(sender: UIGestureRecognizer) {
        controller?.favoriteIconPressed()
    }
    
    @IBAction func homeCategoryButtonPressed(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let popularAction = UIAlertAction(title: Category.popular.title, style: .default, handler: categoryActionSheetHandler(alert:))
        let upcomingAction = UIAlertAction(title: Category.upcoming.title, style: .default, handler: categoryActionSheetHandler(alert:))
        let topRatedAction = UIAlertAction(title: Category.topRated.title, style: .default, handler: categoryActionSheetHandler(alert:))
        let nowPlayingAction = UIAlertAction(title: Category.nowPlaying.title, style: .default, handler: categoryActionSheetHandler(alert:))
        let batalAction = UIAlertAction(title: H.batalText.rawValue, style: .cancel, handler: nil)
        
        optionMenu.addAction(popularAction)
        optionMenu.addAction(upcomingAction)
        optionMenu.addAction(topRatedAction)
        optionMenu.addAction(nowPlayingAction)
        optionMenu.addAction(batalAction)
        
        //IPAD bug
        if let popoverPresentationController = optionMenu.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func categoryActionSheetHandler(alert: UIAlertAction!) {
        switch alert.title {
        case Category.popular.title:
            controller?.actionSheetPressed(category: .popular)
        case Category.upcoming.title:
            controller?.actionSheetPressed(category: .upcoming)
        case Category.topRated.title:
            controller?.actionSheetPressed(category: .topRated)
        case Category.nowPlaying.title:
            controller?.actionSheetPressed(category: .nowPlaying)
        default:
            break
        }
    }
}

//MARK: TableView
extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.list?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = controller?.list?.data[indexPath.row]
        let simpleMovieData = SimpleMovieDataModel(movieId: data?.id ?? 0, movieImage: data?.backdropPath ?? "", movieTitle: data?.title ?? "", movieReleaseDate: data?.releaseDate ?? "", movieOverview: data?.overview ?? "")
        return getSimpleMovieCell(tableView: tableView, data: simpleMovieData)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.tableViewSelected(for: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height * 4) && !(controller?.isLoading ?? false) {
            controller?.loadMoreData()
        }
    }
}

//MARK: TableView Cell
extension HomeView {
    func getSimpleMovieCell(tableView: UITableView, data: SimpleMovieDataModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleMovieTableViewCell.cellName) as! SimpleMovieTableViewCell
        cell.setupCell(data: data)
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: Change View
extension HomeView {
    func navigateToAnotherView(with vc: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
