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

}
