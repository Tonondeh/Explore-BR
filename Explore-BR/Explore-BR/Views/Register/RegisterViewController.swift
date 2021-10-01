//
//  Register.swift
//  Explore-BR
//
//  Created by Elton Souza on 26/08/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.checkButtonEnabled(false)
        self.configTextField()
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
    }
    
    @IBAction func loginBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        self.registerUser(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
    }
    
    func configUI(){
        self.registerButton.layer.cornerRadius = 3.0
        self.registerButton.applyGradient(colors: [blueDarkButton, blueLightButton])
    }
    
    func configTextFieldDelegates(delegate: UITextFieldDelegate?) {
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
    }
    
    private func configTextField() {
        self.configTextFieldDelegates(delegate: self)
        
        self.passwordTextField.isSecureTextEntry = true
        self.confirmPasswordTextField.isSecureTextEntry = true
        
        self.emailTextField.keyboardType = .emailAddress
    }
    
    func validateTextFields() {
        let name: String = self.nameTextField.text ?? ""
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        let confirmPassword: String = self.confirmPasswordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty || name.isEmpty || confirmPassword.isEmpty {
            self.checkButtonEnabled(false)
        } else {
            self.checkButtonEnabled(true)
        }
    }
    
    func checkButtonEnabled(_ isButtonEnabled: Bool) {
        if isButtonEnabled {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    private func registerUser(email: String, password: String) {
        if self.passwordTextField.text != self.confirmPasswordTextField.text {
            self.alert?.showAlert(title: "Ops", message: "As senha estão diferentes, digite novamente por favor", completion: nil)
        } else {
            self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
                
                if let error = error {
                    self.alert?.showAlert(title: "Erro", message: "Verifique os dados inseridos", completion: nil)
                    
                    print("error =", error)
                } else {
                    self.alert?.showAlert(title: "Sucesso!", message: "Usuário cadastrado com sucesso!") {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            })
        }
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            self.emailTextField.becomeFirstResponder()
        }
        
        if textField == self.emailTextField {
            self.passwordTextField.becomeFirstResponder()
        }
        
        if textField == self.passwordTextField {
            self.confirmPasswordTextField.becomeFirstResponder()
        }
        
        if textField == self.confirmPasswordTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.validateTextFields()
    }
    
}

