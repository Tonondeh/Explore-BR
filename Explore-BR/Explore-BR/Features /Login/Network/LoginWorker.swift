//
//  LoginWorker.swift
//  Explore-BR
//
//  Created by Lucas Munho on 05/11/21.
//
import GoogleSignIn
import FirebaseAuth
import FirebaseCore


class LoginWorker{
    
    public func loginWithGoogle(completion: @escaping(_ success: User?, _ error: AuthErrors?) -> Void){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: LoginVC()) { [unowned self] user, error in
            
            if let error = error {
                return print("google error =", error)
            }
            
            guard let authentication = user?.authentication else { return }
            guard let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential, completion: { result, error in
                
                if let error = error {
                    print("error =", error)
                    
//                    MARK: - Chamar completion passando erro
                    
                    completion(nil, .errorSignin)
                    
//                    self.alert?.showAlert(title: "Erro", message: "Erro ao realizar login, verifique os dados e tente novamente", completion: completion)
                } else {
                    let user = User(id: result?.user.uid ?? "", name: result?.user.displayName, email: result?.user.email)
                    completion(user, nil)
                    
//                    let storyboard =  UIStoryboard(name: "Home", bundle: nil)
//                    let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
//
//                    navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
                }
                
            })
            
        }
    }
}



