//
//  ProfileController.swift
//  Explore-BR
//
//  Created by Eduardo Mizael on 08/11/21.
//

import Foundation
import UIKit
import FirebaseAuth

protocol ProfileDelegate:AnyObject{
    func signOut()
}

class ProfileController{
    
    let auth = Auth.auth()
    
    private weak var delegate:ProfileDelegate?
    
    public func delegate(delegate:ProfileDelegate){
        self.delegate = delegate
    }
    
    public func handleLogOut(){
        do {
            try auth.signOut()
            AuthManager.shared.removeUserAuthenticated()
            self.delegate?.signOut()
        } catch let signOutError as NSError {
            print("Error signing out", signOutError)
        }
    }

}
