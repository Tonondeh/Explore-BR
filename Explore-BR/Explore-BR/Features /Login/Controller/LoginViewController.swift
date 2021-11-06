//
//  LoginVC.swift
//  Explore-BR
//
//  Created by Lucas Munho on 05/11/21.
//

protocol LoginViewControllerDelegate: AnyObject {
    func success(user: User)
    func failure(error: AuthErrors)
    
}

class LoginViewController {
    
    weak private var delegate: LoginViewControllerDelegate?
    
    public func delegate(delegate:LoginViewControllerDelegate){
        self.delegate = delegate
    }
    
    func googleLogin() {
        LoginWorker().loginWithGoogle { user, error in
            if let _error = error{
                self.delegate?.failure(error: _error)
            }
            
            if let _user = user{
                AuthManager.shared.cacheUser(id: _user.id)
                self.delegate?.success(user: _user)
            }else{
                self.delegate?.failure(error: .userNotExists)
            }
        }
        
        
    }
}
