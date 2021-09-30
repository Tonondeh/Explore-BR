//
//  EmptyStateTableViewCell.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 29/09/21.
//

import UIKit

class EmptyStateTableViewCell: UITableViewCell {

    static let identifier:String = "EmptyStateTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
}
