//
//  EventsVC.swift
//  Explore-BR
//
//  Created by mac1  on 25/08/21.
//

import UIKit
import FloatingPanel

class EventsVC: UIViewController{
    
    var fpc: FloatingPanelController?
    
    @IBOutlet weak var statusBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFloatingPanel()
        self.configFloatingPanelUI()
    }
    
    private func configFloatingPanel() {
        
        fpc = FloatingPanelController()
        
//        fpc?.delegate = self // Optional
        
        // Set a content view controller.
        let eventMapPanelViewController = EventMapPanelViewController()
        
        fpc?.set(contentViewController: eventMapPanelViewController)
        
        // Add and show the views managed by the `FloatingPanelController` object to self.view.
        fpc?.addPanel(toParent: self)
    }
    
    private func configFloatingPanelUI() {
        let appearance = SurfaceAppearance()
        
        appearance.cornerRadius = 18.0
        
        fpc?.surfaceView.appearance = appearance
        
        fpc?.surfaceView.grabberHandlePadding = 10.0
        fpc?.surfaceView.grabberHandleSize = .init(width: 56.0, height: 2.0)
    }
    
}

