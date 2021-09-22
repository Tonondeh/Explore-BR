//
//  SignInViewController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 25/08/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configTextField()
        
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.emailTextField.keyboardType = .emailAddress
        self.passwordTextField.delegate = self
        
    }
    
    
    func configUI(){
        self.signInButton.layer.cornerRadius = 3.0
        self.signInButton.applyGradient(colors: [blueDarkButton,blueLightButton])
    }
    
    
    
    
    @IBAction func tappedSignInButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeVC
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedForgetPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ResetPassword", sender: nil)
    }
    
    @IBAction func tappedSocialSignInButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Register", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
}

extension SignInViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
