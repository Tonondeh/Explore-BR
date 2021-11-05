//
//  LocationSearchTableViewCell.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 29/09/21.
//

import UIKit

class LocationSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    static let identifier:String = "LocationSearchTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    public func setUpCell(data: Place) {
        self.placeNameLabel.text = data.name
        self.placeAddressLabel.text = data.address
    }
    
}
