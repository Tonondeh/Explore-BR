//
//  HomeVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 26/08/21.
//

import UIKit
import FloatingPanel

class HomeVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var statusBackgroundView: UIView!
    @IBOutlet weak var wrapSearchBarView: UIView!
    @IBOutlet weak var avatarProfileButton: UIButton!
    @IBOutlet weak var searchLabel: UILabel!
    
    var fpc: FloatingPanelController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        self.configFloatingPanel()
        self.configFloatingPanelUI()
        self.configSearchLabel()
        self.setupLabelTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func tappedLabel(_ sender: UITapGestureRecognizer) {
        let storyboard =  UIStoryboard(name: "Search", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Search") as? SearchVC
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedLabel(_:)))
        self.searchLabel.isUserInteractionEnabled = true
        self.searchLabel.addGestureRecognizer(labelTap)
    }
    
    @IBAction func tappedAvatarProfile(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Profile", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Profile") as? ProfileViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    private func configFloatingPanel() {
        fpc = FloatingPanelController()
        
        //        fpc?.delegate = self // Optional
        
        // Set a content view controller.
        let bestReviewsViewController = BestReviewsViewController()
        
        fpc?.set(contentViewController: bestReviewsViewController)
        
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
    
    private func configSearchLabel() {
        self.searchLabel.textColor = UIColor.placeholderText
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
