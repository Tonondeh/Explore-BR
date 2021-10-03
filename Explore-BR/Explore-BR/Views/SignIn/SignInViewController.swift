//
//  SignInViewController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 25/08/21.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configTextField()
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.emailTextField.keyboardType = .emailAddress
        self.passwordTextField.delegate = self
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.autocapitalizationType = .none
        self.passwordTextField.autocorrectionType = .no
    }
    
    
    func configUI(){
        self.signInButton.layer.cornerRadius = 3.0
        self.signInButton.applyGradient(colors: [blueDarkButton,blueLightButton])
    }
    
    func checkButtonEnabled(_ isButtonEnabled: Bool) {
        if isButtonEnabled {
            self.signInButton.setTitleColor(.white, for: .normal)
            self.signInButton.isEnabled = true
        } else {
            self.signInButton.setTitleColor(.lightGray, for: .normal)
            self.signInButton.isEnabled = false
        }
    }
    
    private func handleLogin() {
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        guard !email.isEmpty else { return self.emailTextField.shake() }
        guard !password.isEmpty else { return self.passwordTextField.shake() }
        
        self.auth?.signIn(withEmail: email, password: password, completion: { result, error in
            if let error = error {
                self.alert?.showAlert(title: "Erro", message: "Erro ao realizar login, dados inválidos", completion: nil)
                
                print("Error", error)
            } else {
                let storyboard =  UIStoryboard(name: "Home", bundle: nil)
                let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
                
                self.navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
            }
        })
    }
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        self.handleLogin()
    }
    
    @IBAction func tappedForgetPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ResetPassword", sender: nil)
    }
    
    @IBAction func tappedSocialSignInButton(_ sender: UIButton) {     
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LoginVC.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Register", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
}

extension SignInViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
    
}
