//
//  NewEventViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 29/08/21.
//

import UIKit
import MapKit

class NewEventViewController: UIViewController {
    
    @IBOutlet weak var mainContentView: UIView!
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
        self.configureUI()
        self.configureLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.topItem?.title = "Novo Evento"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureLocation() {
        self.setLocationEventOnMap(latitude: -30.0392981, longitude: -51.2146267)
        self.setAddressEventWithCoordinates(latitude: -30.0392981, longitude: -51.2146267)
    }
    
    private func setLocationEventOnMap(latitude: Double, longitude: Double) {
        let center = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        let region = MKCoordinateRegion(center: center, span: span)
        self.eventMapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        self.eventMapView.addAnnotation(annotation)
    }
    
    private func setAddressEventWithCoordinates(latitude: Double, longitude: Double) {
        var centerAddress : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let geoCoder: CLGeocoder = CLGeocoder()
        
        let latitude: Double = latitude
        let longitude: Double = longitude
        centerAddress.latitude = latitude
        centerAddress.longitude = longitude
        let location: CLLocation = CLLocation(latitude: centerAddress.latitude, longitude: centerAddress.longitude)
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, _) in
            if let placemarks = placemarks {
                let pm = placemarks[0] as CLPlacemark
                if let thoroughfare = pm.thoroughfare, let subThoroughfare = pm.subThoroughfare, let subLocality = pm.subLocality, let locality = pm.locality, let postalCode = pm.postalCode {
                    self.addressLabel.text = "Endereço: \(thoroughfare), \(subThoroughfare)\nBairro: \(subLocality) - \(locality).\nCEP \(postalCode)"
                }
            }
        }
    }
    
    private func configureUI() {
        self.mainContentView.applyGradientInView(colors: [linearBackgroundWhite, linearBackgroundGray])
        
        self.setStyleViewButton(uiView: self.updateLocationView)
        self.setStyleViewButton(uiView: self.selectPhotoView)
        self.setStyleViewButton(uiView: self.takePhotoCameraView)
        
        self.createEventButton.layer.cornerRadius = 3.0
        self.createEventButton.applyGradient(colors: [blueDarkButton,blueLightButton])
    }
    
    private func setStyleViewButton(uiView: UIView) {
        uiView.layer.borderWidth = 1.0
        uiView.layer.borderColor = UIColor(hex: "#000046").cgColor
        uiView.layer.cornerRadius = 15
        uiView.backgroundColor = .clear
    }
    
    private func configNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setGradientBackground(colors: [blueNavController, pinkNavController])
        self.title? = "Novo Evento"
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


