//
//  DetailView.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

class DetailView: UIViewController, DetailControllerToView {
    var controller: DetailViewToController?
    
    @IBOutlet weak var movieDetailImage: UIImageView!
    @IBOutlet weak var movieDetailTitle: UILabel!
    @IBOutlet weak var movieDetailFavoriteIcon: UIImageView!
    @IBOutlet weak var movieDetailReleaseDate: UILabel!
    @IBOutlet weak var movieDetailOverviewText: UILabel!
    @IBOutlet weak var movieDetailOverview: UITextView!
    @IBOutlet weak var movieReviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller?.viewDidLoad()
    }
    
    func setupNavigation(title: String) {
        navBarComponent(title: title)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: D.backButton.rawValue), style: .done, target: self, action: #selector(backPressed(sender:)))
    }
    
    func firstView() {
        movieDetailTitleComponent(title: "")
        movieDetailReleaseDateComponent(releaseDate: "")
        movieDetailOverviewTextComponent(text: "")
        movieDetailOverviewComponent(overview: "")
        movieReviewButtonComponent()
    }
    
    func setupView(url: String, title: String, active: Bool, releaseDate: String, overview: String) {
        movieDetailImageComponent(url: url)
        movieDetailTitleComponent(title: title)
        movieDetailFavoriteIconComponent(active: active)
        movieDetailReleaseDateComponent(releaseDate: releaseDate)
        movieDetailOverviewTextComponent(text: D.overviewText.rawValue)
        movieDetailOverviewComponent(overview: overview)
    }
    
    func changeFavoriteIcon(active: Bool){
        if(active){
            movieDetailFavoriteIcon.image = UIImage(systemName: Icon.favoriteFill.rawValue)
        }
        else{
            movieDetailFavoriteIcon.image = UIImage(systemName: Icon.favoriteEmpty.rawValue)
        }
    }
}

//MARK: Component Attribute
extension DetailView {
    func movieDetailImageComponent(url: String){
        //Better use third party, - Kingfisher
        let url = URL(string: MAPI.backdropPath.rawValue + url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.movieDetailImage.image = UIImage(data: data!)
            }
        }
    }
    
    func movieDetailTitleComponent(title: String){
        movieDetailTitle.text = title
        movieDetailTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func movieDetailFavoriteIconComponent(active: Bool){
        if(active){
            movieDetailFavoriteIcon.image = UIImage(systemName: Icon.favoriteFill.rawValue)
        }
        else{
            movieDetailFavoriteIcon.image = UIImage(systemName: Icon.favoriteEmpty.rawValue)
        }
        
        movieDetailFavoriteIcon.tintColor = .red
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(movieDetailFavoriteIconTapped(tapGestureRecognizer:)))
        movieDetailFavoriteIcon.isUserInteractionEnabled = true
        movieDetailFavoriteIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func movieDetailReleaseDateComponent(releaseDate: String){
        movieDetailReleaseDate.text = releaseDate
        movieDetailReleaseDate.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func movieDetailOverviewTextComponent(text: String){
        movieDetailOverviewText.text = text
        movieDetailOverviewText.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func movieDetailOverviewComponent(overview: String){
        movieDetailOverview.text = overview
        movieDetailOverview.textAlignment = NSTextAlignment.justified
        movieDetailOverview.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        movieDetailOverview.isScrollEnabled = false
        movieDetailOverview.isEditable = false
        movieDetailOverview.isSelectable = false
        movieDetailOverview.isUserInteractionEnabled = false
        movieDetailOverview.textContainer.lineFragmentPadding  = 0
    }
    
    func movieReviewButtonComponent(){
        movieReviewButton.setTitle(D.movieReviewButton.rawValue, for: .normal)
        movieReviewButton.titleLabel?.font     = UIFont.boldSystemFont(ofSize: 16)
        movieReviewButton.tintColor            = .white
        movieReviewButton.backgroundColor      = .systemBlue
    }
}

//MARK: Pressed Action
extension DetailView {
    @objc override func backPressed(sender: UIGestureRecognizer) {
        controller?.backButtonPressed()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func movieDetailFavoriteIconTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        controller?.favoriteIconPressed()
    }
    
    @IBAction func movieReviewButtonPressed(_ sender: Any) {
        controller?.reviewButtonPressed()
    }
}

//MARK: Change View
extension DetailView {
    func navigateToAnotherView(with vc: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}
