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
    
    private var controller: SearchController = SearchController()
    
    var tableViewData: [Place] = []
    
    var resultPlaceSearch:[Place] = []
    var newData: [Place] = []
    
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
        
        self.controller.didSelectItemWith(indexPath: indexPath)
        
        self.searchTableView.reloadData()
        
        //        print("Cell \(indexPath.row + 1) clicked")
        //        let cell = PlacesCollectionViewCell()
        //        cell.cellBackground = UIColor.green
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.controller.numberOfPlaces()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCollectionViewCell.identifier, for: indexPath) as? PlacesCollectionViewCell
        
        if _selectedIndexPath == indexPath{
            
            cell?.isSelected = true
            cell?.backgroundColor = UIColor.systemGray6
        } else {
            cell?.isSelected=false
            cell?.backgroundColor = UIColor.systemGray6
            
        }
        
        cell?.setUpCell(data: self.controller.indexPathOfPlaces(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127, height: 33)
    }
    
}

extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let searchText = searchBar.searchTextField.text ?? ""
        
        if searchText.isEmpty && self.resultPlaceSearch.isEmpty && self.newData.isEmpty {
            return self.controller.numberOfRecentSearches()
        } else {
            
            if self.resultPlaceSearch.isEmpty {
                return 1
            } else {
                return self.resultPlaceSearch.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let searchText: String = self.searchBar.searchTextField.text ?? ""
        
        if searchText.isEmpty && self.resultPlaceSearch.isEmpty && self.newData.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: LocationSearchTableViewCell.identifier, for: indexPath) as? LocationSearchTableViewCell
            
            cell?.setUpCell(data: self.controller.indexPathOfRecentSearches(indexPath: indexPath))
            
            return cell ?? UITableViewCell()
        } else {
            
            if self.resultPlaceSearch.isEmpty{
                let cell = tableView.dequeueReusableCell(withIdentifier: EmptyStateTableViewCell.identifier, for: indexPath) as? EmptyStateTableViewCell
                
                return cell ?? UITableViewCell()
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell
                
                cell?.delegate(delegate: self)
                cell?.index = indexPath
                
                if newData.isEmpty && resultPlaceSearch.isEmpty {
                    cell?.setupCell(data: self.controller.indexPathOfPlaceList(indexPath: indexPath))
                } else {
                    cell?.setupCell(data: self.controller.newData[indexPath.row])
                }
                
                return cell ?? UITableViewCell()
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let searchText = searchBar.searchTextField.text ?? ""
        
        if searchText.isEmpty && self.resultPlaceSearch.isEmpty {
            return 92
        }
        
        return 414
    }
    
    
}

extension SearchVC: SearchTableViewCellDelegate {
    func changeHeartState(index: Int) {
//        self.controller.placeList[index].heartIconEnable = !(self.controller.placeList[index].heartIconEnable ?? false)
//
//        let isHeartEnabled: Bool = self.controller.placeList[index].heartIconEnable ?? false
//
//        self.controller.placeList[index].heartIconEnable = isHeartEnabled
//
//        self.searchTableView.reloadData()
    }
    
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.controller.searchPlaceWith(searchText: searchText)
        self.searchTableView.reloadData()
    }
    
}
