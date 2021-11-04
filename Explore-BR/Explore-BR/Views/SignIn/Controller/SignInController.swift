//
//  SignInController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 02/11/21.
//

import UIKit
import FirebaseAuth

enum Fields:String {
    case email = "email"
    case password = "password"
}

protocol SignInControllerDelegate:AnyObject{
    func errorTextField(field:Fields)
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
             
            
        }
        
    
        
    }
}
