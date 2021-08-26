//
//  LoginVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 25/08/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginAppleButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var loginEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.loginAppleButton.layer.cornerRadius = 3.0
        self.loginGoogleButton.layer.cornerRadius = 3.0
        self.loginEmailButton.layer.cornerRadius = 3.0
    }
}
