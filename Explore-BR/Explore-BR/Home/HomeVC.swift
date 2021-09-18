//
//  HomeVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 26/08/21.
//

import UIKit

class HomeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var statusBackgroundView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var wrapSearchBarView: UIView!
    @IBOutlet weak var avatarProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.searchTextField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.layer.zPosition = 0
        self.showMenu()
    }
    
    @objc func showMenu() {
        let slideVC = FrameModalMenu()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedAvatarProfile(_ sender: UIButton) {
        showMenu()
    }
    
    func configureUI() {
        self.statusBackgroundView.applyGradientInView(colors: [blueDarkButton,blueLightButton])
        
        self.wrapSearchBarView.layer.cornerRadius = self.wrapSearchBarView.frame.size.height/2
        self.wrapSearchBarView.layer.borderColor = UIColor.white.cgColor
        self.wrapSearchBarView.layer.borderWidth = 1.5
        self.wrapSearchBarView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.wrapSearchBarView.layer.shadowOpacity = 1
        self.wrapSearchBarView.layer.shadowRadius = 30
        self.wrapSearchBarView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        
        self.avatarProfileButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.avatarProfileButton.layer.shadowOpacity = 1
        self.avatarProfileButton.layer.shadowRadius = 30
        self.avatarProfileButton.layer.shadowOffset = CGSize(width: 0, height: 4.0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }

}

extension HomeVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
