//
//  SimpleMovieReviewTableViewCell.swift
//  Movie App
//
//  Created by Kevin Josal on 18/10/21.
//  Copyright © 2021 Kevin Josal. All rights reserved.
//

import UIKit

class SimpleMovieReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var review: UITextView!
    
    static var nib = UINib(nibName: String(describing: SimpleMovieReviewTableViewCell.self), bundle: Bundle(for: SimpleMovieReviewTableViewCell.self))
    static let cellName: String = String(describing: SimpleMovieReviewTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(data: SimpleMovieReviewDataModel){
        authorComponent(text: data.author)
        reviewComponent(text: data.review)
    }
    
}

//MARK: Component Attribute
extension SimpleMovieReviewTableViewCell {
    func authorComponent(text: String){
        author.text = text
        author.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    func reviewComponent(text: String){
        review.text = text
        review.textAlignment = NSTextAlignment.justified
        review.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        review.isScrollEnabled = false
        review.isEditable = false
        review.isSelectable = false
        review.isUserInteractionEnabled = false
        review.textContainer.lineFragmentPadding = 0
    }
}
