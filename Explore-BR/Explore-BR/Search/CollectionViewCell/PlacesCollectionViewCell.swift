//
//  PlacesCollectionViewCell.swift
//  Explore-BR
//
//  Created by Lucas Munho on 13/09/21.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "PlacesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
