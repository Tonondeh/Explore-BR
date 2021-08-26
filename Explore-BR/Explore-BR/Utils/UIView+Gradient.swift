//
//  UIView+Gradient.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 26/08/21.
//

import UIKit

extension UIView {
    func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 1)
    }
}

