//
//  PlacesCollectionViewCell.swift
//  Explore-BR
//
//  Created by Lucas Munho on 13/09/21.
//

import UIKit

protocol PlacesCollectionViewCellDelegate:AnyObject{
    func changePlaceButtonState(index : Int)
}

class PlacesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placesButton: UIButton!
    
    var index:IndexPath?
    
    weak private var delegate:PlacesCollectionViewCellDelegate?
    
    public func delegate(delegate:PlacesCollectionViewCellDelegate?){
        self.delegate = delegate
    }
    
    static let identifier:String = "PlacesCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
        
    }
    
    func setUpCell(data: Place){
        self.placesButton.setTitle("   "+data.name+"   ", for: .normal)
        if let isPlaceButtonEnable = data.placeButtonEnable {
            if isPlaceButtonEnable {
                self.placesButton.tintColor = .white
                self.placesButton.applyGradient(colors: [blueDarkButton,blueLightButton])
            }else{
//                self.placesButton.layer.removeFromSuperlayer()
                self.placesButton.tintColor = .black
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func tappedPlacesButton(_ sender: UIButton) {
        
        if let indexPath = index {
            self.delegate?.changePlaceButtonState(index: indexPath.row)
            
            if self.placesButton.tintColor == .black{
                print("Preto nessa porra")
                self.placesButton.applyGradient(colors: [blueDarkButton,blueLightButton])
                self.placesButton.tintColor = .white
            }else{
                print("Gradiente")
                self.placesButton.layer.sublayers?.popLast()
                self.placesButton.tintColor = .black
            }
            
//
//            if self.placesButton.tintColor == .white {
//                print("Branco")
//                self.placesButton.backgroundColor = .white
//                //            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
//                self.placesButton.tintColor = .black
//            } else {
//                //            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//                print("Gradiente")
//                self.placesButton.tintColor = .white
//
//                self.placesButton.applyGradient(colors: [blueDarkButton,blueLightButton])
//            }
        }
        
    }
    
    
}
