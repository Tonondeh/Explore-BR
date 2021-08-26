//
//  SignInViewController.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 25/08/21.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
      
        
    }
    
    func configUI(){
        self.signInButton.layer.cornerRadius = 3.0
        self.signInButton.applyGradient(colors: [blueDarkButton,blueLightButton])
    }

   
}
