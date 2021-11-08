//
//  ResetPasswordViewController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 25/08/21.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        
    }
    

    func configUI(){
        self.resetPasswordButton.layer.cornerRadius = 3.0
        self.resetPasswordButton.applyGradient(colors: [blueLightButton,blueDarkButton])
    
    }

    //fazer logica com o firebase e alert para confirmacao e volta p/SingIn
    @IBAction func tappedChangePassword(_ sender: UIButton) {
        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            let storyboard =  UIStoryboard(name: "SignIn", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SignIn") as? SignInViewController
            self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Register", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
}
