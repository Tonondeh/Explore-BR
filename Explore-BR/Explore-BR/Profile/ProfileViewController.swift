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
        self.configNavigationBar()
        self.configBackgroundGradient()
    }
    
    @IBAction func tappedChangePasswordButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedSignOutButton(_ sender: UIButton) {
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

//extension UINavigationBar {
//    func setGradientBackground(colors: [Any]) {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        
//        gradient.locations = [0.2, 1]
//        
//        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
//        
//        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
//        
//        var updatedFrame = self.bounds
//        
//        updatedFrame.size.height += self.frame.origin.y
//        
//        gradient.frame = updatedFrame
//        
//        gradient.colors = colors;
//        
//        self.setBackgroundImage(self.image(fromLayer: gradient), for: .default)
//    }
//    
//    func image(fromLayer layer: CALayer) -> UIImage {
//        UIGraphicsBeginImageContext(layer.frame.size)
//        
//        layer.render(in: UIGraphicsGetCurrentContext()!)
//        
//        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//        
//        return outputImage!
//    }
//}
