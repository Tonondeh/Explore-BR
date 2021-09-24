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
    
    @IBOutlet weak var searchTableView: UITableView!
    
    
    var placesArray: [Place] = [Place(name: "Parques", placeButtonEnable: true),Place(name: "Restaurantes", placeButtonEnable: false), Place(name: "Shopping", placeButtonEnable: false), Place(name: "Cinema", placeButtonEnable: false), Place(name: "zoologico", placeButtonEnable: false), Place(name: "Horti-Fruti", placeButtonEnable: false), Place(name: "Mercado", placeButtonEnable: false), Place(name: "Padaria", placeButtonEnable: false)]
    
    var placeList:[LocalList] = [LocalList(image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parque", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: [1,2,3,4,5]), LocalList(image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parque", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: [1,2,3,4,5]),LocalList(image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parque", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: [1,2,3,4,5])]
    
    
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
        self.navigationItem.titleView = searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "Search"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func configTableView(){
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        self.searchTableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    
    func configCollectionView(){
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
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
        searchBar.searchTextField.layer.cornerRadius = 20.0
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.placeholder = "Faça sua Busca"
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.setPositionAdjustment(UIOffset(horizontal: 27, vertical: 0), for: .search)
        searchBar.setPositionAdjustment(UIOffset(horizontal: -25, vertical: 0), for: .clear)
        searchBar.searchTextField.layer.shadowColor = UIColor.black.cgColor
        searchBar.searchTextField.layer.borderColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.borderWidth = 1.5
        searchBar.layer.shadowOpacity = 0.40
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        searchBar.layer.shadowRadius = 5
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


extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.placesArray[indexPath.row].placeButtonEnable = !(self.placesArray[indexPath.row].placeButtonEnable ?? false)
        self.collectionView.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.placesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCollectionViewCell.identifier, for: indexPath) as? PlacesCollectionViewCell else { return UICollectionViewCell ()}
        
        cell.delegate(delegate: self)
        cell.index = indexPath
        cell.setUpCell(data: self.placesArray[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127, height: 33)
    }
    
}

extension SearchVC:PlacesCollectionViewCellDelegate{
    func changePlaceButtonState(index: Int) {
        
        if let isPlaceButtonEnable = self.placesArray[index].placeButtonEnable{
            print("Acionou", isPlaceButtonEnable )
//            if isPlaceButtonEnable {
//                self.placesArray[index].placeButtonEnable = false
//            } else {
//                self.placesArray[index].placeButtonEnable = true
//            }
        }
        self.placesArray[index].placeButtonEnable = !(self.placesArray[index].placeButtonEnable ?? false)
        
    }
}

extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell
        
        cell?.setupCell(data: self.placeList[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 414
    }
    
    
}

