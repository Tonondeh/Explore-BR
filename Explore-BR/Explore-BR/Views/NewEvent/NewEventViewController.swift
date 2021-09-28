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
        self.configTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configNavigationBar() {
//        let layer0 = CAGradientLayer()
//        layer0.colors = [
//            UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,
//            UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor
//        ]
//        if let colors = layer0.colors {
//            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
//        }
        self.navigationController?.navigationBar.setGradientBackground(colors: [blueNavController, pinkNavController])
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.title = "Novo Evento"
    }
    
    private func configTextField() {
        self.eventNameTextField.layer.borderWidth = 1
        self.eventNameTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.inicialDateTextField.layer.borderWidth = 1
        self.inicialDateTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.endDateTextField.layer.borderWidth = 1
        self.endDateTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.descriptionTextField.layer.borderWidth = 1
        self.descriptionTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        if let imageIcon: UIImage = UIImage(named: "nameEventImage.png") {
            
            self.eventNameTextField.setTextIconAndPlaceholder(icon: imageIcon, placeholder: "Qual o nome do evento")
            
           }
       
        if let imageCalendar: UIImage = UIImage(named: "calendarImage.png"){
            
            self.inicialDateTextField.setTextIconAndPlaceholder(icon: imageCalendar, placeholder: "Data de inicio")
            
            self.endDateTextField.setTextIconAndPlaceholder(icon: imageCalendar, placeholder: "Data de fim")
            
        }
        
        if let imageDescripiton: UIImage = UIImage(named: "descriptionImage.png"){
            
            self.descriptionTextField.setTextIconAndPlaceholder(icon: imageDescripiton, placeholder: "Dê uma breve descrição para o evento")
        }
    }

}


