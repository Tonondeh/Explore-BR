//
//  SearchTableViewCell.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 23/09/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var localTypeLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starOneImage: UIImageView!
    @IBOutlet weak var starTwoImage: UIImageView!
    @IBOutlet weak var starThreeImage: UIImageView!
    @IBOutlet weak var starFourImage: UIImageView!
    @IBOutlet weak var starFiveImage: UIImageView!
    @IBOutlet weak var backgroundHeartView: UIView!
    @IBOutlet weak var heartButton: UIButton!
    
    static let identifier:String = "SearchTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tappedHeartButton(_ sender: UIButton) {
    }
    
}
