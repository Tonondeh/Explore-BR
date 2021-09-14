//
//  SearchVCViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 25/08/21.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var placesArray: [Place] = [Place(name: "Parques"),Place(name: "Restaurantes"), Place(name: "Shopping"), Place(name: "Cinema"), Place(name: "zoologico"), Place(name: "Horti-Fruti"), Place(name: "Mercado"), Place(name: "Padaria")]
    
    
    
//    @IBOutlet weak var cardView: UIView!
    
//    @IBOutlet weak var buttonHoteis: UIButton!
//
//    @IBOutlet weak var buttonParques: UIButton!
//
//    @IBOutlet weak var buttonRestaurantes: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configSearchBar()
        self.configCollectionView()
//        self.configCardView()
//        self.configUI()
        navigationItem.titleView = searchBar
        
    }
    
    func configCollectionView(){
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            
        self.collectionView.register(PlacesCollectionViewCell.nib(), forCellWithReuseIdentifier: PlacesCollectionViewCell.identifier)
}
        
        
        
    }
    
//    func configUI(){
//       self.buttonParques.layer.cornerRadius = 3.0
//        self.buttonParques.applyGradient(colors: [blueDarkButton,blueLightButton])
//
//
//
//    }
//    func configCardView(){
//        self.cardView.layer.cornerRadius = 20.0
//    }
    
    func configSearchBar(){
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.cornerRadius = 100.0
        
        
        }
    
    func configNavigationBar(){
        let layer0 = CAGradientLayer()
        
        
        
        layer0.colors = [
            
            
            
            UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,
            
            
            
            UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor
            
            
            
        ]
        if let colors = layer0.colors {
            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
        }
    }
    
    
    
}


extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.placesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCollectionViewCell.identifier, for: indexPath) as? PlacesCollectionViewCell else { return UICollectionViewCell ()}

        cell.setUpCell(data: self.placesArray[indexPath.row])
        
        
        return cell
        
    }
    
    
    
    
}
