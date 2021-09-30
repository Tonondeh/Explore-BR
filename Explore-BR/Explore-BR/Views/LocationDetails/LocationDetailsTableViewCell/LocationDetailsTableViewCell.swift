//
//  LocationDetailsTableViewCell.swift
//  Explore-BR
//
//  Created by Ederson on 28/09/21.
//

import UIKit

class LocationDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewTableView: UITableView!
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var quantityEvaluationsLabel: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var evalueteButton: UIButton!
    @IBOutlet weak var loadPhotoButton: UIButton!
    
    static let identifier:String = "LocationDetailsTableViewCell"
    
    // Avaliações
    var listReviews:[PlaceReview] = []
    
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addReview()
        self.configButtons()
        self.configView()
        self.configTableView()
    }
    
    private func addReview(){
        self.listReviews.append(PlaceReview(reviewImage: UIImage(named:"location-detail-1") ?? UIImage(), name: "Ederson Dias Silva", title: "O local é ótimo", review: "Ótimo local para fazer atividades físicas.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: UIImage(named:"location-detail-2") ?? UIImage(), name: "Katty Loaiza", title: "Local silencioso", review: "Bom local para descansar a mente.", stars:5))
        
        self.listReviews.append(PlaceReview(reviewImage: UIImage(named:"location-detail-3") ?? UIImage(), name: "Walter Casagrande", title: "Bom local pra levar a família", review: "Bom local pra levar a família.", stars:5))
        
    }
    
    private func configTableView(){
        self.reviewTableView.delegate = self
        self.reviewTableView.dataSource = self
        self.reviewTableView.register(ReviewTableViewCell.nib(), forCellReuseIdentifier: ReviewTableViewCell.identifier)
    }
    
    private func configButtons() {
        self.evalueteButton.applyGradient(colors: [blueLightButton, blueDarkButton])
        self.loadPhotoButton.applyGradient(colors: [blueLightButton, blueDarkButton])
        
        self.evalueteButton.layer.cornerRadius = 6.0
        self.loadPhotoButton.layer.cornerRadius = 6.0
    }
    
    private func configView() {
        self.detailsView.layer.cornerRadius = 20.0
    }
    
    public func setupCell(place: PlaceDetail){
        self.photoImageView.image = place.photo
        self.nameLabel.text = place.name
        self.descriptionLabel.text = place.description
        self.quantityEvaluationsLabel.text = "\(place.quantityEvaluations) avaliações" 
    }
    
}

extension LocationDetailsTableViewCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell:ReviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else{ return UITableViewCell() }
                
        cell.setupCell(review: self.listReviews[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
