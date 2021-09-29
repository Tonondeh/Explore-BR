//
//  EventsVC.swift
//  Explore-BR
//
//  Created by mac1  on 25/08/21.
//

import UIKit
import MapKit
import CoreLocation
import FloatingPanel


class EventsVC: UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var fpc: FloatingPanelController?
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFloatingPanel()
        self.configFloatingPanelUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        self.location()
    }
    
    private func configFloatingPanel() {
        fpc = FloatingPanelController()
        let eventMapPanelViewController = EventMapPanelViewController()
        fpc?.set(contentViewController: eventMapPanelViewController)
        fpc?.addPanel(toParent: self)
    }
    
    private func configFloatingPanelUI() {
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 18.0
        fpc?.surfaceView.appearance = appearance
        fpc?.surfaceView.grabberHandlePadding = 10.0
        fpc?.surfaceView.grabberHandleSize = .init(width: 56.0, height: 2.0)
    }
    
    private func location(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
                
    }
    
}

extension EventsVC: MKMapViewDelegate, CLLocationManagerDelegate{
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering...")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        if let location = locations.first {
            self.locationManager.stopUpdatingLocation()
            
            render(location)
            }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
       
        self.mapView.setRegion(region, animated: true)

        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        self.mapView.addAnnotation(pin)

    }
    
}

