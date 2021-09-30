//
//  ReviewTableViewCell.swift
//  Explore-BR
//
//  Created by Ederson on 30/09/21.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewNameLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    static let identifier:String = "ReviewTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCell(review:PlaceReview){
        self.reviewImageView.image = review.reviewImage
        self.reviewNameLabel.text = review.name
        self.titleLabel.text = review.title
        self.reviewLabel.text = review.review
    }
    
}
