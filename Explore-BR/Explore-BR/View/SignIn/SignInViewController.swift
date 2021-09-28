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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configTextField()
        
        self.auth = Auth.auth()
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
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("ta vazio")
        } else {
            auth?.signIn(withEmail: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: { result, error in
                
                if let error = error {
                    print("error", error)
                } else {
                    print("deu certo!")
                    // fazer navegação...
                }
                
            })
        }
        
    }
    
    @IBAction func tappedForgetPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ResetPassword", sender: nil)
    }
    
    @IBAction func tappedSocialSignInButton(_ sender: UIButton) {
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    
    
}

extension SignInViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
