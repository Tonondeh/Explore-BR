//
//  ChangePasswordViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 25/08/21.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTextField()
        self.configNavigationBar()
        
        self.saveButton.layer.cornerRadius = 6
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
    
    private func configTextFieldDelegates(delegate: UITextFieldDelegate?) {
        self.currentPasswordTextField.delegate = delegate
        self.newPasswordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
    }
    
    private func configTextField() {
        self.configTextFieldDelegates(delegate: self)
        self.currentPasswordTextField.layer.borderWidth = 1
        self.currentPasswordTextField.layer.borderColor = UIColor.systemGray.cgColor
        self.currentPasswordTextField.isSecureTextEntry = true
        
        self.newPasswordTextField.layer.borderWidth = 1
        self.newPasswordTextField.layer.borderColor = UIColor.systemGray.cgColor
        self.newPasswordTextField.isSecureTextEntry = true
        
        self.confirmPasswordTextField.layer.borderWidth = 1
        self.confirmPasswordTextField.layer.borderColor = UIColor.systemGray.cgColor
        self.confirmPasswordTextField.isSecureTextEntry = true
        
        if let imageIcon: UIImage = UIImage(named: "locked.png") {
            
            self.currentPasswordTextField.setTextIconAndPlaceholder(icon: imageIcon, placeholder: "Digite sua senha atual:")
            
            self.newPasswordTextField.setTextIconAndPlaceholder(icon: imageIcon, placeholder: "Entre com a nova senha:")
            
            self.confirmPasswordTextField.setTextIconAndPlaceholder(icon: imageIcon, placeholder: "Confirme a senha:")
        }
        
        
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
    
}

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.currentPasswordTextField {
            self.newPasswordTextField.becomeFirstResponder()
        }
        
        if textField == self.newPasswordTextField {
            self.confirmPasswordTextField.becomeFirstResponder()
        }
        
        if textField == confirmPasswordTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
