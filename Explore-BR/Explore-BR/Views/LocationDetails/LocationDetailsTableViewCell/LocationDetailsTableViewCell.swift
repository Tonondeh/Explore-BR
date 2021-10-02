//
//  LocationDetailsTableViewCell.swift
//  Explore-BR
//
//  Created by Ederson on 28/09/21.
//

import UIKit

class LocationDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLocationDetailView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var quantityEvaluationsLabel: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var evalueteButton: UIButton!
    
    var placeDetail:PlaceDetail?
    var currentNavigation:UINavigationController?
    
    static let identifier:String = "LocationDetailsTableViewCell"
        
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configButtons()
        self.configView()
    }
    
    private func configButtons() {
        self.evalueteButton.applyGradient(colors: [blueDarkButton, blueLightButton])
        self.evalueteButton.layer.cornerRadius = 6.0
    }
    
    @IBAction func tappedEvalueteButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Review", bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: "Review") as? ReviewViewController

        vc?.placeDetail = self.placeDetail
        
        self.currentNavigation?.present(vc ?? UIViewController(), animated: true, completion: nil)
    }
    
    private func configView() {
        //self.contentLocationDetailView.applyGradientInView(colors: [linearBackgroundWhite, linearBackgroundGray])
        self.detailsView.layer.cornerRadius = 20.0
    }
    
    public func setupCell(place: PlaceDetail){
        self.placeDetail = place
        self.photoImageView.image = place.photo
        self.nameLabel.text = place.name
        self.descriptionLabel.text = place.description
        self.quantityEvaluationsLabel.text = "\(place.quantityEvaluations) avaliações" 
    }
    
}
