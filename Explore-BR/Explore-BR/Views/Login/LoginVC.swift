//
//  LoginVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 25/08/21.
//

import GoogleSignIn
import UIKit
import Firebase
import AuthenticationServices
import CryptoKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginAppleButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        self.auth = Auth.auth()
        self.alert = Alert(viewController: self)
    }
    
    @IBAction func tappedLoginAppleButton(_ sender: UIButton) {
        print("Apertou Botao Apple")
        startSignInWithAppleFlow()
    }
    
  
    @IBAction func tappedLoginGoogleButton(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                return print("google error =", error)
            }
            
            guard let authentication = user?.authentication else { return }
            guard let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            self.auth?.signIn(with: credential, completion: { result, error in
                
                if let error = error {
                    print("error =", error)
                    
                    self.alert?.showAlert(title: "Erro", message: "Erro ao realizar login, verifique os dados e tente novamente", completion: nil)
                } else {
                    let storyboard =  UIStoryboard(name: "Home", bundle: nil)
                    let tabbar: UITabBarController? = (storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as? UITabBarController)
                    
                    navigationController?.pushViewController(tabbar ?? UITabBarController(), animated: true)
                }
                
            })
            
        }
        
    }
    
    
    @IBAction func tappedLoginEmailButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignIn", sender: nil)
    }
    
    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.performRequests()
    }
    
    private func configureUI() {
        self.loginAppleButton.layer.cornerRadius = 3.0
        self.loginGoogleButton.layer.cornerRadius = 3.0
        self.loginEmailButton.layer.cornerRadius = 3.0
    }
}


private func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: Array<Character> =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}


// Unhashed nonce.
fileprivate var currentNonce: String?

private func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    return String(format: "%02x", $0)
  }.joined()

  return hashString
}



extension LoginVC:ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
        guard let _ = currentNonce else {
          fatalError("Invalid state: A login callback was received, but no login request was sent.")
        }
        guard let appleIDToken = appleIDCredential.identityToken else {
          print("Unable to fetch identity token")
          return
        }
        guard let _ = String(data: appleIDToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
          return
        }
      }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
      // Handle error.
      print("==================Sign in with Apple errored: \(error.localizedDescription)")
    }

  }

