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
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    let datePickerStart = UIDatePicker()
    let datePickerEnd = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()
        self.configTextField()
        self.configureUI()
        self.configureLocation()
        self.createDatePickerStart()
        self.createDatePickerEnd()
        self.configImagePicker()
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
    
    @IBAction func tappedCreateEventButton(_ sender: UIButton) {
        if let message: String? = self.validateFields() {
            
        }
    }
    
    private func validateFields() -> String? {
        if self.eventMapView.isUserLocationVisible {
            return "É necessário informar as coordenadas de latidude e longitude "
        }
        return nil
    }
    
    enum viewSelected: Int {
        case camera = 10
        case photoLibrary = 20
    }
    
    private func setupTapViewTakePhotoCamera() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.takePhotoCameraView.tag = viewSelected.camera.rawValue
        self.takePhotoCameraView.addGestureRecognizer(tapGesture)
        self.takePhotoCameraView.isUserInteractionEnabled = true
    }
    
    private func setupTapViewSelectPhotoLibrary() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.selectPhotoView.tag = viewSelected.photoLibrary.rawValue
        self.selectPhotoView.addGestureRecognizer(tapGesture)
        self.selectPhotoView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        guard let viewGestureReceived = gesture.view else { return }
        let view = viewGestureReceived
        let tag: viewSelected = viewSelected(rawValue: view.tag) ?? .photoLibrary
        
        switch tag {
        case .photoLibrary:
            UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
            
        case .camera:
            UIImagePickerController.isSourceTypeAvailable(.camera)
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    private func configImagePicker() {
        self.imagePicker.delegate = self
    }
    
    private func createDatePickerStart() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(okPressedStart))
        toolbar.setItems([okButton], animated: true)
        
        self.inicialDateTextField.inputAccessoryView = toolbar
        self.inicialDateTextField.inputView = datePickerStart
        
        datePickerStart.datePickerMode = .dateAndTime
        datePickerStart.preferredDatePickerStyle = .wheels
    }
    
    @objc func okPressedStart() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        self.inicialDateTextField.text = formatter.string(from: datePickerStart.date)
        self.view.endEditing(true)
    }
    
    private func createDatePickerEnd() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(okPressedEnd))
        toolbar.setItems([okButton], animated: true)
        
        self.endDateTextField.inputAccessoryView = toolbar
        self.endDateTextField.inputView = datePickerEnd
        datePickerEnd.datePickerMode = .dateAndTime
        datePickerEnd.preferredDatePickerStyle = .wheels
    }
    
    @objc func okPressedEnd() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        self.endDateTextField.text = formatter.string(from: datePickerEnd.date)
        self.view.endEditing(true)
    }
    
    private func setupTapLabelUpdateLocation() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappedUpdateLocation(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.updateLocationView.addGestureRecognizer(tapGesture)
        self.updateLocationView.isUserInteractionEnabled = true
    }
    
    @objc func tappedUpdateLocation(_ sender: UITapGestureRecognizer) {
        self.setLocationEventOnMap(latitude: -30.0392981, longitude: -51.2146267)
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
        
        self.setupTapLabelUpdateLocation()
        self.setupTapViewSelectPhotoLibrary()
        self.setupTapViewTakePhotoCamera()
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

extension NewEventViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageReceived = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.photoEventImageView.contentMode = .scaleAspectFill
        self.photoEventImageView.image = imageReceived
        picker.dismiss(animated: true, completion: nil)
    }
}
