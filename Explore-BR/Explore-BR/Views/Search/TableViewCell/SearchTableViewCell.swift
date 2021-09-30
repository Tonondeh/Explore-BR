//
//  SearchTableViewCell.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 23/09/21.
//

import UIKit

protocol SearchTableViewCellDelegate: AnyObject {
    func changeHeartState(index: Int)
}

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardWrapperView: UIView!
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
    
    var index: IndexPath?
    
    weak private var delegate: SearchTableViewCellDelegate?

    public func delegate(delegate: SearchTableViewCellDelegate?) {
        self.delegate = delegate
    }
    

    static let identifier:String = "SearchTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.configCardWrapperView()
        self.configBackgroundHeartView()
    }
    
    @IBAction func tappedHeartButton(_ sender: UIButton) {
        if let indexPath = index {
            self.delegate?.changeHeartState(index: indexPath.row)
        }
    }
    
    
    
    private func configCardWrapperView() {
        self.cardWrapperView.layer.cornerRadius = 20
    }
    
    private func configBackgroundHeartView() {
        self.backgroundHeartView.layer.cornerRadius = 18
        self.backgroundHeartView.layer.shadowColor = UIColor.black.cgColor
        self.backgroundHeartView.layer.borderColor = UIColor.white.cgColor
        self.backgroundHeartView.layer.borderWidth = 1.5
        self.backgroundHeartView.layer.shadowOpacity = 0.40
        self.backgroundHeartView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.backgroundHeartView.layer.shadowRadius = 5
    }

    public func setupCell(data:Place){
        self.cardImageView.image = data.image
        self.localTypeLabel.text = data.localType
        self.localLabel.text = data.name
        self.descriptionLabel.text = data.description
        self.heartButton.setImage(data.heartIcon, for: .normal)
        
        guard let isHeartEnabled = data.heartIconEnable else { return }
        
        if isHeartEnabled {
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.heartButton.tintColor = .red
        } else {
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.heartButton.tintColor = .red
        }
    }
    
    
}
