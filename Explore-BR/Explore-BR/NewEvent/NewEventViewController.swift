//
//  NewEventViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 29/08/21.
//

import UIKit
import MapKit

class NewEventViewController: UIViewController {
    
    @IBOutlet weak var eventLocalLabel: UILabel!
    
    
    @IBOutlet weak var mapKitView: MKMapView!
    
    
    @IBOutlet weak var updateLocationButton: UIButton!
    
    
    @IBOutlet weak var askLabel: UILabel!
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    
    @IBOutlet weak var inicialDateTextField: UITextField!
    
    
    @IBOutlet weak var endDateTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()

       
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

}
