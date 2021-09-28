//
//  LocationDetailsViewController.swift
//  Explore-BR
//
//  Created by Ederson on 25/08/21.
//

import UIKit

class LocationDetailsViewController: UIViewController {

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var evalueteButton: UIButton!    
    @IBOutlet weak var loadPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configButton()
        self.configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "Mais Informações"
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configNavigationBar() {
        
        let layer0 = CAGradientLayer()
        
        layer0.colors = [
            
            UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,
            
            UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor
            
        ]
        
        if let colors = layer0.colors {
            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
        }
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    private func configButton() {
        self.evalueteButton.applyGradient(colors: [blueLightButton, blueDarkButton])
        self.loadPhotoButton.applyGradient(colors: [blueLightButton, blueDarkButton])
        
        self.evalueteButton.layer.cornerRadius = 6.0
        self.loadPhotoButton.layer.cornerRadius = 6.0
    }
    
    private func configView() {
        self.detailsView.layer.cornerRadius = 20.0
    }

}
