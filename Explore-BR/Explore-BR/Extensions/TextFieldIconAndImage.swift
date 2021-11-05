//
//  TextFieldIconAndImage.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 26/08/21.
//

import UIKit

extension UITextField {

    
    func setTextIconAndPlaceholder(icon: UIImage, placeholder: String) {
        let imageView = UIImageView()
        imageView.image = icon
        imageView.frame = CGRect(x: 24, y: -3, width: 21, height: 31)
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 25)
        view.backgroundColor = UIColor.clear
        view.addSubview(imageView)
        self.leftView = view
        self.leftViewMode = UITextField.ViewMode.always
        self.placeholder = placeholder
    }

}

extension UITextView {
    func setTextIconAndPlaceholder(icon: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = icon
        imageView.frame = CGRect(x: 24, y: 6, width: 21, height: 27)
        self.addSubview(imageView)
    }

}
