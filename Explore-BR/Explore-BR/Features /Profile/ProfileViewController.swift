//
//  ProfileViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 24/08/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configButton()
        self.configImageView()
//        self.configNavigationBar()
        self.configBackgroundGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.title = "Perfil"
    }
    
    @IBAction func tappedChangePasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChangePassword", sender: self)
    }
    
    @IBAction func tappedSignOutButton(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func configButton() {
        self.changePasswordButton.layer.cornerRadius = 6.0
        self.signOutButton.layer.cornerRadius = 6.0
    }
    
    private func configImageView() {
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.size.height / 2
    }
    
    private func configNavigationBar() {
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,
            UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor
        ]
        if let colors = layer0.colors {
            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
        }

        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configBackgroundGradient() {
        
        self.view.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
        
        self.view.backgroundColor = .white
        
        let layer0 = CAGradientLayer()
        
        layer0.colors = [
            
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
            
            UIColor(red: 0.894, green: 0.914, blue: 0.992, alpha: 1).cgColor
            
        ]
        
        layer0.locations = [0.33, 1]
        
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.04, b: 1.43, c: -1.43, d: 1.25, tx: 0.82, ty: -0.83))
        
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        
        layer0.position = view.center
        
        self.view.layer.insertSublayer(layer0, at: 0)
        
    }
    
}

extension ProfileViewController: ProfileDelegate{
    func signOut() {


        let rootViewController = self.view.window?.rootViewController as? UINavigationController
        rootViewController?.setViewControllers([rootViewController?.viewControllers.first ?? UIViewController()],
        animated: true)
        rootViewController?.popToRootViewController(animated: true)
        
    }

}
