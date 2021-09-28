//
//  NewEventViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 29/08/21.
//

import UIKit
import MapKit

class NewEventViewController: UIViewController {
        
    @IBOutlet weak var eventMapView: MKMapView!
    @IBOutlet weak var updateLocationView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var inicialDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var photoEventImageView: UIImageView!
    @IBOutlet weak var selectPhotoView: UIView!
    @IBOutlet weak var takePhotoCameraView: UIView!
    @IBOutlet weak var createEventButton: UIButton!
    
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
        self.navigationController?.navigationBar.setGradientBackground(colors: [blueNavController, pinkNavController])
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
//        self.navigationController?.title = "Novo Evento"
        self.navigationItem.title = "Novo Evento"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func configTextField() {
        self.eventNameTextField.layer.borderWidth = 1
        self.eventNameTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.inicialDateTextField.layer.borderWidth = 1
        self.inicialDateTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.endDateTextField.layer.borderWidth = 1
        self.endDateTextField.layer.borderColor = UIColor.systemGray.cgColor
        
        self.descriptionTextView.layer.borderWidth = 1
        self.descriptionTextView.layer.borderColor = UIColor.systemGray.cgColor
        
        if let imageIcon: UIImage = UIImage(named: "nameEventImage.png") {
            
            self.eventNameTextField.setTextIconAndPlaceholder(icon: imageIcon, placeholder: "Qual o nome do evento")
            
           }
       
        if let imageCalendar: UIImage = UIImage(named: "calendarImage.png"){
            
            self.inicialDateTextField.setTextIconAndPlaceholder(icon: imageCalendar, placeholder: "Data de inicio")
            
            self.endDateTextField.setTextIconAndPlaceholder(icon: imageCalendar, placeholder: "Data de fim")
            
        }
        
//        if let imageDescripiton: UIImage = UIImage(named: "descriptionImage.png"){
//            
//            self.descriptionTextView.setTextIconAndPlaceholder(icon: imageDescripiton, placeholder: "Dê uma breve descrição para o evento")
//        }
    }

}


