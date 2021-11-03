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
}

class SignInController {
    
    private weak var delegate:SignInControllerDelegate?
    
    public func delegate(delegate:SignInControllerDelegate){
        self.delegate = delegate
    }
    
    public func handleLogin(email:String? = "" , password:String? = "") {
        
        guard email != "" else {
            self.delegate?.errorTextField(field: .email)
            return
        }
        
        guard password != "" else {
            self.delegate?.errorTextField(field: .password)
            return
        }
        
//        self.auth?.signIn(withEmail: email, password: password, completion: { result, error in
//            if let error = error {
//                self.alert?.showAlert(title: "Erro", message: "Erro ao realizar login, dados inválidos", completion: nil)
//
//                print("Error", error)
//            } else {
//                let storyboard =  UIStoryboard(name: "Home", bundle: nil)
//                let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
//
//                self.navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
//            }
//        })
    }
    
    
}
