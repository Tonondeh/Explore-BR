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
        
        SignInWorker().signInEmailFirebase(withEmail: email, password: password) { user, error in
            if let _error = error {
                self.delegate?.failureSignIn(error: _error)
                return
            }
            
            if let _user = user {
                self.delegate?.successSignIn(user: _user)
            } else {
                self.delegate?.failureSignIn(error: .userNotExists)
            }
        }
    }
}
