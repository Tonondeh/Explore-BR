//
//  LoginVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 25/08/21.
//

import GoogleSignIn
import UIKit
import FirebaseAuth
import FirebaseCore

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginAppleButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    var controller: LoginViewController = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
        self.controller.delegate(delegate: self)
        
    }
    
    @IBAction func tappedLoginAppleButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedLoginGoogleButton(_ sender: UIButton) {
        self.controller.googleLogin()
        
    }
    
    
    @IBAction func tappedLoginEmailButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignIn", sender: nil)
    }
    
    private func configureUI() {
        self.loginAppleButton.layer.cornerRadius = 3.0
        self.loginGoogleButton.layer.cornerRadius = 3.0
        self.loginEmailButton.layer.cornerRadius = 3.0
    }
}

extension LoginVC: LoginViewControllerDelegate{
    func success(user:User) {
        let storyboard =  UIStoryboard(name: "Home", bundle: nil)
        let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
        navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
    }
    
    func failure(error:AuthErrors) {
        self.alert?.showAlert(title: "Erro", message: "Erro ao logar. Tente novamente.", completion: nil)
        
    }
    
    
}
