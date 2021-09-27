//
//  PlacesCollectionViewCell.swift
//  Explore-BR
//
//  Created by Lucas Munho on 13/09/21.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placesLabel: UILabel!
    @IBOutlet weak var placesView: UIView!
    
    static let identifier:String = "PlacesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
        
    }
    
    override var isSelected: Bool {
        willSet {
            super.isSelected = newValue
            
            if newValue {
                self.placesLabel.textColor = .white
                self.placesView.backgroundColor = .blue
            } else {
                self.placesLabel.textColor = .black
                self.placesView.backgroundColor = .white
            }
        }
    }
    
    func setUpCell(data: Place){
        self.placesLabel.text = data.name
        
        if let isPlaceButtonEnable = data.placeButtonEnable {
            print("isPlaceButtonEnable", isPlaceButtonEnable)
//            if isPlaceButtonEnable {
//                
//                self.placesLabel.textColor = .white
//                //                self.placesView.applyGradientInView(colors: [blueDarkButton,blueLightButton])
//                self.placesView.backgroundColor = .blue
//                
//            } else {
//                
//                self.placesView.backgroundColor = .white
//                self.placesLabel.textColor = .black
//                
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.placesView.layer.borderColor = UIColor.black.cgColor
        self.placesView.layer.borderWidth = 1
        self.placesView.layer.cornerRadius = 6
    }
    
}
