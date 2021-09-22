//
//  TextField+Animation.swift
//  Explore-BR
//
//  Created by ANDRE LUIZ TONON on 18/09/21.
//

import  UIKit

extension UITextField{
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.10
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 12.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 12.0, y: self.center.y)
        layer.add(animation, forKey: "position")
        
        
        let color = CABasicAnimation(keyPath: "borderColor")
        color.fromValue = UIColor.red.cgColor
        //        color.toValue = UIColor.clear
        color.duration = 2
        color.repeatCount = 1
        
        layer.add(color, forKey: "borderColor")
        
        let border = CABasicAnimation(keyPath: "borderWidth")
        border.fromValue = 3
        border.toValue = 0
        border.duration = 2
        border.repeatCount = 1
        //        layer.borderWidth = 3
        layer.add(border, forKey: "borderWidth")
        
    }
}
