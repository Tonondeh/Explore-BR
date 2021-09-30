//
//  SearchVCViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 25/08/21.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var recentSearchLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    var tableViewData: [Place] = []
    
    var placesArray: [Place] = [Place(name: "Parques", placeButtonEnable: true, id: "1"),Place(name: "Restaurantes", placeButtonEnable: false, id: "2"), Place(name: "Shopping", placeButtonEnable: false, id: "3"), Place(name: "Cinema", placeButtonEnable: false, id: "4"), Place(name: "Zoologico", placeButtonEnable: false, id: "5")]
    
    var placeList:[Place] = [
        Place(name: "cascata do osvaldo", image: UIImage(named: "location-detail") ?? UIImage(), localType: "wwwwww", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 4.4, id: "1"),
        Place(name: "cascata do caracol",image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 2.5, id: "2"),
        Place(name: "cachoeira", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3"),Place(name: "lalalalal", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, id: "3")
    ]
    
    let searchRecents: [Place] = [
        Place(name: "Praça X", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 4.4, address: "Endereço abcdefg", id: "1"),
        Place(name: "Praça Y", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 2.5, address: "Endereço abcde", id: "2"),
        Place(name: "Praça Z", image: UIImage(named: "location-detail") ?? UIImage(), localType: "Parques", local: "Foz", description: "Cachoeira", heartIconEnable: true, heartIcon: UIImage(systemName: "heart.fill") ?? UIImage(), star: 5.0, address: "Endereço abc", id: "3")
    ]
    
    var resultPlaceSearch:[Place] = []
    var newData: [Place] = []
    
    var data: [Place] = []
    
    func selectItem(name: String) {
        let searchLower = name.lowercased()
        
        data = self.placeList.filter {
            let filterBy = $0.localType?.lowercased()
            return filterBy?.lowercased().contains(searchLower) ?? true
        }
        
        print("data", data)
        
        resultPlaceSearch = data
        
        print("resultPlaceSearch", resultPlaceSearch)
        
        self.searchTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configSearchBar()
        self.configCollectionView()
        self.configTableView()
        self.navigationItem.titleView = searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backItem?.backButtonTitle = ""
        
    }
    
    func configTableView(){
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        self.searchTableView.separatorStyle = .none
        self.searchTableView.register(SearchTableViewCell.nib(), forCellReuseIdentifier: SearchTableViewCell.identifier)
        self.searchTableView.register(EmptyStateTableViewCell.nib(), forCellReuseIdentifier: EmptyStateTableViewCell.identifier)
        self.searchTableView.register(LocationSearchTableViewCell.nib(), forCellReuseIdentifier: LocationSearchTableViewCell.identifier)
    }
    
    func configCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = .systemGray6
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            self.collectionView.register(PlacesCollectionViewCell.nib(), forCellWithReuseIdentifier: PlacesCollectionViewCell.identifier)
        }
        
    }
    
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
        searchBar.delegate = self
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

var _selectedIndexPath : IndexPath? = nil

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath) {
        self.selectItem(name: self.placesArray[indexPath.row].name ?? "")
        
//        self.searchTableView.reloadData()
        
        print("Cell \(indexPath.row + 1) clicked")
        let cell = PlacesCollectionViewCell()
        cell.cellBackground = UIColor.green
      }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        self.selectItem(name: self.placesArray[indexPath.row].name ?? "")
//
//        self.placesArray[indexPath.row].placeButtonEnable = !(self.placesArray[indexPath.row].placeButtonEnable ?? false)
//        self.collectionView.reloadItems(at: [indexPath])
//
//        if ((_selectedIndexPath) != nil){
//
//            if indexPath.compare(_selectedIndexPath!) == ComparisonResult.orderedSame {
//
//                //if the user tap the same cell that was selected previously deselect it.
//
//                _selectedIndexPath = nil;
//            }
//            else
//            {
//                // save the currently selected indexPath
//
//                _selectedIndexPath = indexPath
//
//            }
//        }
//        else{
//
//            // else, savee the indexpath for future reference if we don't have previous selected cell
//
//            _selectedIndexPath = indexPath;
//        }
//
//        // and now only reload only the visible cells
//
//        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.placesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCollectionViewCell.identifier, for: indexPath) as? PlacesCollectionViewCell
        
        if _selectedIndexPath == indexPath{
            
            //If the cell is selected
            cell?.isSelected = true
            cell?.backgroundColor = UIColor.systemGray6
        }
        else{
            // If the cell is not selected
            cell?.isSelected=false
            cell?.backgroundColor = UIColor.systemGray6
            
        }
        
        cell?.setUpCell(data: self.placesArray[indexPath.row])
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func searchPlace(searchText: String) {
        let searchLower = searchText.lowercased()
        
        newData = self.placeList.filter {
            let filterBy = $0.name?.lowercased()
            return filterBy?.lowercased().contains(searchLower) ?? true
        }
        
        print("newData", newData)
        
        resultPlaceSearch = newData
        
        print("resultPlaceSearch", resultPlaceSearch)
        
        self.searchTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127, height: 33)
    }
    
}

extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let searchText = searchBar.searchTextField.text ?? ""
        
//        if searchText.isEmpty {
//            return self.searchRecents.count
//        } else {
//
//            if self.resultPlaceSearch.isEmpty {
//                return 1
//            } else {
//                return self.resultPlaceSearch.count
//            }
            return self.resultPlaceSearch.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let searchText: String = self.searchBar.searchTextField.text ?? ""
        
        if searchText.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: LocationSearchTableViewCell.identifier, for: indexPath) as? LocationSearchTableViewCell
            
            cell?.setUpCell(data: self.searchRecents[indexPath.row])
            
            return cell ?? UITableViewCell()
        } else {
            
            if self.resultPlaceSearch.isEmpty{
                let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell
                
                return cell ?? UITableViewCell()
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell
                
                cell?.delegate(delegate: self)
                cell?.index = indexPath
                
                if newData.isEmpty {
                    cell?.setupCell(data: self.placeList[indexPath.row])
                } else {
                    cell?.setupCell(data: self.newData[indexPath.row])
                }
                
                return cell ?? UITableViewCell()
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let searchText = searchBar.searchTextField.text ?? ""
        
        if searchText.isEmpty {
            return 92
        }
        
        return 414
    }
    
    
}

extension SearchVC: SearchTableViewCellDelegate {
    func changeHeartState(index: Int) {
        self.placeList[index].heartIconEnable = !(self.placeList[index].heartIconEnable ?? false)
        
        let isHeartEnabled: Bool = self.placeList[index].heartIconEnable ?? false
        
        if isHeartEnabled {
            self.placeList[index].heartIcon = UIImage(systemName: "heart.fill") ?? UIImage()
        } else {
            self.placeList[index].heartIcon = UIImage(systemName: "heart") ?? UIImage()
        }
        
        self.searchTableView.reloadData()
    }
    
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchPlace(searchText: searchText)
    }
    
}
