//
//  BestReviewsTableViewCell.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

public enum TypeReview: String {
    case bestReview = "Melhores Avaliados"
    case moreLiked = "Mais Curtidos"
}

class ReviewsTableViewCell: UITableViewCell {
    @IBOutlet weak var cardHeaderLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cardList: [Review] = []
    private var currentNavigation: UINavigationController?
    
    static let identifier: String = "BestReviewsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configCollectionView()
        self.selectionStyle = .none
    }
    
    private func configCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(CardCollectionViewCell.nib(), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.collectionViewLayout = layout
    }
}

extension ReviewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell

        cell?.setupCell(data: self.cardList[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 209)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard =  UIStoryboard(name: "LocationDetails", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LocationDetails") as? LocationDetailsViewController
        // Necessário enviar o model para location details
        // vc.setContentReview(self.cardList[indexPath.row])
        self.currentNavigation?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    public func setupCell(typeReview: TypeReview, cardList: [Review]) {
        self.cardHeaderLabel.text = typeReview.rawValue
        self.cardList = cardList
    }
    
    public func setCurrentNavigationController(navigation: UINavigationController?) {
        self.currentNavigation = navigation
    }

}
