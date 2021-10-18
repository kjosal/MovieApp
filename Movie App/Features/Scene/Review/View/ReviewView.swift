//
//  ReviewView.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

class ReviewView: UIViewController, ReviewControllerToView {
    var controller: ReviewViewToController?
    
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
    }
    
    func setupNavigation() {
        navBarWithBackComponent(title: R.title.rawValue)
    }
    
    func setupView() {
        registerTableView()
    }
    
    func registerTableView(){
        reviewTableView.register(SimpleMovieReviewTableViewCell.nib, forCellReuseIdentifier: SimpleMovieReviewTableViewCell.cellName)
        
        reviewTableView.delegate    = self
        reviewTableView.dataSource  = self
        
        reviewTableView.estimatedRowHeight   = UITableView.automaticDimension
        reviewTableView.rowHeight            = UITableView.automaticDimension
        
        reviewTableView.tableFooterView = UIView()
    }
    
    func refreshTableView() {
        reviewTableView.reloadData()
    }
}

//MARK: TableView
extension ReviewView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.list?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = controller?.list?.data[indexPath.row]
        let simpleMovieReviewData = SimpleMovieReviewDataModel(author: data?.author ?? "", review: data?.content ?? "")
        return getSimpleMovieReviewCell(tableView: tableView, data: simpleMovieReviewData)
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
extension ReviewView {
    func getSimpleMovieReviewCell(tableView: UITableView, data: SimpleMovieReviewDataModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleMovieReviewTableViewCell.cellName) as! SimpleMovieReviewTableViewCell
        cell.setupCell(data: data)
        cell.selectionStyle = .none
        return cell
    }
}
