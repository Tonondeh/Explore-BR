//
//  SignInWorker.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 03/11/21.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class SignInWorker {
    
    
    public func signInEmailFirebase(withEmail email:String, password:String , completion:@escaping(_ success:User?, _ error:Error? )->Void ){
        
        
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(nil, error)
            } else {
               
                guard let id = result?.user.uid else { return }
                
                let user = User(id: id, name: "Teste", email: "teste@teste.com")
            }
        }
    }
}

