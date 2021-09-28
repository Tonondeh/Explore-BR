//
//  LoginVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 25/08/21.
//

import GoogleSignIn
import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginAppleButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
    }
    
    @IBAction func tappedLoginAppleButton(_ sender: UIButton) {
    }
    
    @IBAction func tappedLoginGoogleButton(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                return print("google error =", error)
            }
            
            guard let authentication = user?.authentication else { return }
            guard let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            self.auth?.signIn(with: credential, completion: { result, error in
                
                if let error = error {
                    print("error =", error)
                    
                    self.alert?.showAlert(title: "Erro", message: "Erro ao realizar login, verifique os dados e tente novamente", completion: nil)
                } else {
                    let storyboard =  UIStoryboard(name: "Home", bundle: nil)
                    let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
                    
                    navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
                }
                
            })
            
        }
        
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
