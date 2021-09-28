//
//  Register.swift
//  Explore-BR
//
//  Created by Elton Souza on 26/08/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
   
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    
    func configUI(){
        self.registerButton.layer.cornerRadius = 3.0
        self.registerButton.applyGradient(colors: [blueLightButton,blueDarkButton])

       

    }

}


