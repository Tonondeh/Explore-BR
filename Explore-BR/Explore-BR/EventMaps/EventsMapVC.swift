//
//  EventsMapVC.swift
//  Explore-BR
//
//  Created by Eduardo Mizael on 15/09/21.
//

import UIKit
import FloatingPanel

class EventsMapVC: UIViewController, UITextFieldDelegate{
    
    var fpc: FloatingPanelController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFloatingPanel()
    }
    
    private func configFloatingPanel() {
        fpc = FloatingPanelController()
        
        //                fpc.delegate = self // Optional
        
        // Set a content view controller.
        //                let contentVC = LoginVC()
        fpc.set(contentViewController: UIViewController())
        
        fpc.track(scrollView: UITableView())
        
        // Add and show the views managed by the `FloatingPanelController` object to self.view.
        fpc.addPanel(toParent: self)
    }
    
    @objc func showMenu() {
        let slideVC = EventModalMenu()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
//    func configureUI() {
//        self.statusBackgroundView.applyGradientInView(colors: [blueLightButton,blueLightButton])
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}

extension EventsMapVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
