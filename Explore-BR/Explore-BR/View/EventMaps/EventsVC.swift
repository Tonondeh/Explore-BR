//
//  EventsVC.swift
//  Explore-BR
//
//  Created by mac1  on 25/08/21.
//

import UIKit

class EventsVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var statusBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showMenu()
    }
    
    @objc func showMenu() {
        let slideVC = EventModalMenu()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    func configureUI() {
//        self.statusBackgroundView.applyGradientInView(colors: [blueLightButton,blueLightButton])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}

extension EventsVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
