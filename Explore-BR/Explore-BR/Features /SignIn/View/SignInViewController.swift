//
//  SignInViewController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 25/08/21.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    private var controller:SignInController = SignInController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configTextField()
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
        self.controller.delegate(delegate: self)
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
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
            self.controller.handleLogin(email: self.emailTextField.text, password: self.passwordTextField.text)
    }
    
    @IBAction func tappedForgetPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ResetPassword", sender: nil)
    }
    
    @IBAction func tappedSocialSignInButton(_ sender: UIButton) {     
        self.navigationController?.popToRootViewController(animated: true)
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

extension SignInViewController:SignInControllerDelegate {
    func startLoading() {
        self.showSpinner()
    }
    
    func stopLoading() {
        self.removeSpinner()
    }
    
    func successSignIn(user: User) {
        let storyboard =  UIStoryboard(name: "Home", bundle: nil)
        let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
        
        self.navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
    }
    
    func failureSignIn(error: AuthErrors) {
        var msgError: String = ""
        switch error {
        case .userNotExists:
            msgError = "Usuário não existe"
        case .invalidData:
            msgError = "Dados inválidos"
        case .errorServer:
            msgError = "Erro ao buscar os dados. Tente novamente."
        case .errorSignin:
            msgError = "Erro ao logar. Tente novamente."
        }
        
        self.alert?.showAlert(title: "Erro", message: msgError, completion: nil)
    }
    
    func errorTextField(field: Fields) {
        switch field {
        case .email:
            self.emailTextField.shake()
        case .password:
            self.passwordTextField.shake()
        }
    }
    
    
}
