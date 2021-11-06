//
//  RegisterController.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation

enum FieldsRegister: String {
    case name = "name"
    case email = "email"
    case password = "password"
    case confirmPassword = "confirmPassword"
}

protocol RegisterControllerDelegate: AnyObject{
    func errorTextField(field:FieldsRegister)
    func successRegister(user: UserRegister)
    func failureRegister(error: AuthErrors)
    func errorConfirmPassword()
    func startLoading()
    func stopLoading()
}


class RegisterController {
    
    private weak var delegate: RegisterControllerDelegate?
    
    public func delegate(delegate: RegisterControllerDelegate) {
        self.delegate = delegate
    }
    
    public func registerUser(name: String? = "", email: String? = "", password: String? = "", confirmPassword: String? = "") {
        
        guard let _name = name, name != "" else {
            self.delegate?.errorTextField(field: .name)
            return
        }
        
        guard let _email = email, email != "" else {
            self.delegate?.errorTextField(field: .email)
            return
        }
        
        guard let _password = password, password != "" else {
            self.delegate?.errorTextField(field: .password)
            return
        }
        
        guard let _confirmPassword = confirmPassword, confirmPassword != "" else {
            self.delegate?.errorTextField(field: .confirmPassword)
            return
        }
        
        guard _confirmPassword == _password else {
            self.delegate?.errorConfirmPassword()
            return
        }
        
        self.delegate?.startLoading()
        
        RegisterWorker().createUserFirebase(name:_name, email:_email, password:_password) { user , error in
            
            if let _error = error {
                self.delegate?.failureRegister(error: _error)
                self.delegate?.stopLoading()
                return
            }
            
            if let _user = user {
                AuthManager.shared.cacheUser(id: _user.id)
                self.delegate?.successRegister(user: _user)
            }else{
                self.delegate?.failureRegister(error: .userNotExists)
            }
            
            self.delegate?.stopLoading()
            
        }
    }
}
