//
//  SignInController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 02/11/21.
//

import UIKit

enum Fields:String {
    case email = "email"
    case password = "password"
}

protocol SignInControllerDelegate:AnyObject{
    func errorTextField(field:Fields)
    func successSignIn(user: User)
    func failureSignIn(error: AuthErrors)
    func startLoading()
    func stopLoading()
}

class SignInController {
    
    private weak var delegate:SignInControllerDelegate?
    
    public func delegate(delegate:SignInControllerDelegate){
        self.delegate = delegate
    }
    
    public func handleLogin(email:String? = "" , password:String? = "") {
        
        guard let email = email, email != "" else {
            self.delegate?.errorTextField(field: .email)
            return
        }
        
        guard let password = password, password != "" else {
            self.delegate?.errorTextField(field: .password)
            return
        }
        
        self.delegate?.startLoading()
        
        SignInWorker().signInEmailFirebase(withEmail: email, password: password) { user, error in
            if let _error = error {
                self.delegate?.failureSignIn(error: _error)
                self.delegate?.stopLoading()
                return
            }
            
            if let _user = user {
                AuthManager.shared.cacheUser(id: _user.id)
                self.delegate?.successSignIn(user: _user)
            } else {
                self.delegate?.failureSignIn(error: .userNotExists)
            }
            self.delegate?.stopLoading()
        }
    }
}
