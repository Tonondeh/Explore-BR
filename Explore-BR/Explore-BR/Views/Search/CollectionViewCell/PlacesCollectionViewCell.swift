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
    
    
    @IBOutlet weak var placesLabel: UILabel!
    @IBOutlet weak var placesView: UIView!
    
    
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
        self.placesLabel.text = data.name
        print("data.placeButtonEnable", data.placeButtonEnable)
        if let isPlaceButtonEnable = data.placeButtonEnable {
            if !isPlaceButtonEnable {
                self.placesLabel.tintColor = .white
                self.placesView.applyGradientInView(colors: [blueDarkButton,blueLightButton])
            }else{
//                for layer in self.placesView.layer.sublayers!{
//                    print("batata 123")
//                    if layer != nil{
//                        layer.removeFromSuperlayer()
//                    }
//                }
//                self.placesView.layer.removeFromSuperlayer()
                self.placesLabel.tintColor = .black
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//    @IBAction func tappedPlacesButton(_ sender: UIButton) {
//
//        if let indexPath = index {
//            self.delegate?.changePlaceButtonState(index: indexPath.row)
//
//            if self.placesButton.tintColor == .black{
//                print("Preto nessa porra")
//                self.placesButton.applyGradient(colors: [blueDarkButton,blueLightButton])
//                self.placesButton.tintColor = .white
//            }else{
//                print("Gradiente")
//                self.placesButton.layer.sublayers?.popLast()
//                self.placesButton.tintColor = .black
//            }
//
//        }
        
//    }
    
    
}
