//
//  Register.swift
//  Explore-BR
//
//  Created by Elton Souza on 26/08/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.checkButtonEnabled(false)
        self.configTextField()
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    
    func configUI(){
        self.registerButton.layer.cornerRadius = 3.0
        self.registerButton.applyGradient(colors: [blueLightButton,blueDarkButton])

       

    }
    
    func configTextFieldDelegates(delegate: UITextFieldDelegate?) {
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
    }
    
    private func configTextField() {
        self.configTextFieldDelegates(delegate: self)
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

