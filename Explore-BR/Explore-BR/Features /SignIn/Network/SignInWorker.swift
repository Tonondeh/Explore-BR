//
//  SignInWorker.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 03/11/21.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SignInWorker {
    
    public func signInEmailFirebase(withEmail email: String, password: String, completion: @escaping(_ success: User?, _ error: AuthErrors?) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(nil, .errorSignin)
                return
            } else {
                guard let id = result?.user.uid else {
                    completion(nil, .userNotExists)
                    return
                }
                
                let docRef = Firestore.firestore().collection("users").document(id)
                docRef.getDocument { document, error in
                    guard error == nil else {
                        completion(nil, .errorServer)
                        return
                    }
                    guard let _document = document else {
                        completion(nil, .invalidData)
                        return
                    }
                    
                    do {
                        let user = try _document.data(as: User.self)
                        completion(user, nil)
                    } catch {
                        completion(nil, .invalidData)
                    }
                }

            }
        }
    }
}
