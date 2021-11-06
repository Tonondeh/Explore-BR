//
//  RegisterWorker.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class RegisterWorker {
    
    public func createUserFirebase(name:String, email:String, password:String, completion:@escaping(_ success:UserRegister?, _ error:AuthErrors? ) ->Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(nil, .errorSignin)
                return
            }else{
                guard let id = result?.user.uid else {
                    completion(nil, .invalidData)
                    return
                }
                let user = UserRegister(id: id, name: name, email: email)
                do {
                    try Firestore.firestore().collection("users").document(user.id).setData(from: user)
                    completion(user,nil)
                } catch {
                    completion(nil,.invalidData)
                }
            }
        }
        
        
    }
    
    
    
    
}
