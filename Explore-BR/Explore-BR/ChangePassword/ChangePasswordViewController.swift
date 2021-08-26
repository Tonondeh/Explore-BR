//
//  ChangePasswordViewController.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 25/08/21.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTextField()
    }

    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
    
    private func configTextField() {
        var iconImageView = UIImageView()
        var image = UIImage(named: "lock.png")
        
        iconImageView.image = image
        
        self.currentPasswordTextField.leftView = iconImageView
    }
    
}
