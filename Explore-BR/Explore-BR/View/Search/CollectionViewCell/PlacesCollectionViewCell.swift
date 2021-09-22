//
//  PlacesCollectionViewCell.swift
//  Explore-BR
//
//  Created by Lucas Munho on 13/09/21.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placesButton: UIButton!
    
    
    
    static let identifier:String = "PlacesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
        
        
        
    }
    
    func setUpCell(data: Place){
        
        self.placesButton.setTitle(data.name, for: .normal)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedPlacesButton(_ sender: UIButton) {
        
        
        
}
    
    
}
