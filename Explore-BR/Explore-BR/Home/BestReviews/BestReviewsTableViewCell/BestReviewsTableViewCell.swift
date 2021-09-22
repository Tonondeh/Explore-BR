//
//  BestReviewsTableViewCell.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import UIKit

class BestReviewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardHeaderLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cardList: [BestReview] = []
    
    static let identifier: String = "BestReviewsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configCollectionView()
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
    
//    public func setupCell(data: BestReview) {
//        self.bestReviewsImage.image = data.image
//        self.nameLabel.text = data.title
//        self.localTypeLabel.text = data.type
//        self.localLabel.text = data.region
//    }
    
}

extension BestReviewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell
        
        cell?.setupCell(data: self.cardList[indexPath.row])
//        cell?.roundCorners(.allCorners, radius: 30.0)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 309)
    }
    
    public func setupCell(cardList: [BestReview]) {
        self.cardList = cardList
    }

}

