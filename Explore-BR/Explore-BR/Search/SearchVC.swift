//
//  SearchVCViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 25/08/21.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configSearchBar()
        self.configCardView()
        navigationItem.titleView = searchBar
        
        
        
    }
    func configCardView(){
        self.cardView.layer.cornerRadius = 20.0
    }
    
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
