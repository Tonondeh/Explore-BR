//
//  EventsVC.swift
//  Explore-BR
//
//  Created by mac1  on 25/08/21.
//

import UIKit
import MapKit
import FloatingPanel

class EventsVC: UIViewController{
    
    var fpc: FloatingPanelController?
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFloatingPanel()
        self.configFloatingPanelUI()
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
        let appleHQ = CLLocation(latitude: 37.334, longitude: -122.008889)
        let regionRadius: CLLocationDistance = 1000.0
        let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        mapView.delegate = self
        mapView.mapType = .standard
    }
    
}

extension EventsVC: MKMapViewDelegate{
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("rendering...")
    }
}

