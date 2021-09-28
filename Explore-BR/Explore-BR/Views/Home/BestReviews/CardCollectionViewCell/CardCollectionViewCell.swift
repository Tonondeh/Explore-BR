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
    @IBOutlet weak var backgroundHeartView: UIView!
    @IBOutlet weak var heartImage: UIImageView!
    
    static let identifier: String = "CardCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configBackgroundHeartView()
    }
    
    private func configBackgroundHeartView() {
        self.backgroundHeartView.layer.cornerRadius = 12
        self.backgroundHeartView.layer.shadowColor = UIColor.black.cgColor
        self.backgroundHeartView.layer.borderColor = UIColor.white.cgColor
        self.backgroundHeartView.layer.borderWidth = 1.5
        self.backgroundHeartView.layer.shadowOpacity = 0.40
        self.backgroundHeartView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.backgroundHeartView.layer.shadowRadius = 5
    }
    
    override func layoutSubviews() {
           // cell rounded section
           self.layer.cornerRadius = 18.0
           self.layer.borderWidth = 5.0
           self.layer.borderColor = UIColor.clear.cgColor
           self.layer.masksToBounds = true
           
           // cell shadow section
           self.contentView.layer.cornerRadius = 18.0
           self.contentView.layer.borderWidth = 5.0
           self.contentView.layer.borderColor = UIColor.clear.cgColor
           self.contentView.layer.masksToBounds = true
           self.layer.shadowColor = UIColor.black.cgColor
           self.layer.shadowOffset = CGSize(width: 0, height: 4.0)
           self.layer.shadowRadius = 6.0
           self.layer.shadowOpacity = 0.6
           self.layer.cornerRadius = 18.0
           self.layer.masksToBounds = false
           self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
       }
    
    public func setupCell(data: BestReview) {
        self.cardImage.image = data.image
        self.cardTitleLabel.text = data.title
        self.cardLocalTypeLabel.text = data.type
        self.cardRegionLabel.text = data.region
    }

}
