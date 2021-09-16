//
//  EventsMapVC.swift
//  Explore-BR
//
//  Created by Eduardo Mizael on 15/09/21.
//

import UIKit

class EventsMapVC: UIViewController, UITextFieldDelegate{
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

extension EventsMapVC: UIViewControllerTransitioningDelegate {
func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    ModalPresentationController(presentedViewController: presented, presenting: presenting)
}
}
