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
        
        
        
//        } else {
//            self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
//                
//                if let error = error {
//                    self.alert?.showAlert(title: "Erro", message: "Verifique os dados inseridos", completion: nil)
//                    
//                    print("error =", error)
//                } else {
//                    self.alert?.showAlert(title: "Sucesso!", message: "Usuário cadastrado com sucesso!") {
//                        self.navigationController?.popViewController(animated: true)
//                    }
//                }
//                
//            })
//        }
    }
}
