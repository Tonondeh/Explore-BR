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
    }
    
    
    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        let storyboard =  UIStoryboard(name: "Register", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Register") as? RegisterViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    
}
