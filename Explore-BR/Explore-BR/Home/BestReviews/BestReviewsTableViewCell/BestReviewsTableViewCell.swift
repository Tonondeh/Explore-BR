//
//  BestReviewsTableViewCell.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class BestReviewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageTest: UIImageView!
    
    static let identifier: String = "BestReviewsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(data: BestReview) {
        self.imageTest.image = data.testImage
    }
    
}
