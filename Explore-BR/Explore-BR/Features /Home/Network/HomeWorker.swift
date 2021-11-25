//
//  HomeWorker.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 24/11/21.
//

import Foundation
import FirebaseFirestore

class HomeWorker {
    
    public func getUserFirebase(id: String, completion: @escaping(_ success: User?, _ error: AuthErrors?) -> Void) {
        let docRef = Firestore.firestore().collection("users").document(id)
        docRef.getDocument { document, error in
            guard error == nil else {
                completion(nil, .userNotExists)
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
