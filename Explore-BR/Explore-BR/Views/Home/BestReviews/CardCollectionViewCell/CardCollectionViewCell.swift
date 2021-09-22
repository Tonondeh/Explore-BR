//
//  CardCollectionViewCell.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 19/09/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardLocalTypeLabel: UILabel!
    @IBOutlet weak var cardRegionLabel: UILabel!
    
    static let identifier: String = "CardCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cardImage.layer.cornerRadius = 10.0
    }
    
    public func setupCell(data: BestReview) {
        self.cardImage.image = data.image
        self.cardTitleLabel.text = data.title
        self.cardLocalTypeLabel.text = data.type
        self.cardRegionLabel.text = data.region
    }

}
