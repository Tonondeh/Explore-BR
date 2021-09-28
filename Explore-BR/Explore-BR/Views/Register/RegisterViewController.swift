//
//  Register.swift
//  Explore-BR
//
//  Created by Elton Souza on 26/08/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
   
    }
    

    func configUI(){
        self.registerButton.layer.cornerRadius = 3.0
        self.registerButton.applyGradient(colors: [blueLightButton,blueDarkButton])

       

    }

}


