//
//  SimpleMovieTableViewCell.swift
//  Movie App
//
//  Created by Kevin Josal on 16/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

class SimpleMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    static var nib = UINib(nibName: String(describing: SimpleMovieTableViewCell.self), bundle: Bundle(for: SimpleMovieTableViewCell.self))
    static let cellName: String = String(describing: SimpleMovieTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(data: SimpleMovieDataModel){
        movieImageComponent(url: data.movieImage)
        movieTitleComponent(title: data.movieTitle)
        movieReleaseDateComponent(releaseDate: data.movieReleaseDate)
        movieOverviewComponent(description: data.movieOverview)
    }
}

//MARK: Component Attribute
extension SimpleMovieTableViewCell {
    func movieImageComponent(url: String){
        //Better use third party, - Kingfisher
        movieImage.image = UIImage(named: "placeholder")
        
        let url = URL(string: MAPI.backdropPath.rawValue + url)

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url!) else { return }
            DispatchQueue.main.async {
                self.movieImage.image = UIImage(data: data)
            }
        }
    }
    
    func movieTitleComponent(title: String){
        movieTitle.text = title
        movieTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func movieReleaseDateComponent(releaseDate: String){
        movieReleaseDate.text = releaseDate
        movieReleaseDate.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func movieOverviewComponent(description: String){
        movieOverview.text = description
        movieOverview.textAlignment = NSTextAlignment.justified
        movieOverview.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        movieOverview.isScrollEnabled = false
        movieOverview.isEditable = false
        movieOverview.isSelectable = false
        movieOverview.isUserInteractionEnabled = false
        movieOverview.textContainer.lineFragmentPadding = 0
    }
}
