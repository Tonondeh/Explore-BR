//
//  NavigationBarGradient.swift
//  Explore-BR
//
//  Created by Lucas Munho on 25/08/21.
//


import UIKit


extension UINavigationBar {

    func setGradientBackground(colors: [Any]) {

        let gradient: CAGradientLayer = CAGradientLayer()

        

        gradient.locations = [0.2, 1]

        

        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)

        

        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)

        

        var updatedFrame = self.bounds

        

        updatedFrame.size.height += self.frame.origin.y

        

        gradient.frame = updatedFrame

        

        gradient.colors = colors;

        

        self.setBackgroundImage(self.image(fromLayer: gradient), for: .default)

    }

    

    func image(fromLayer layer: CALayer) -> UIImage {

        UIGraphicsBeginImageContext(layer.frame.size)

        

        layer.render(in: UIGraphicsGetCurrentContext()!)

        

        let outputImage = UIGraphicsGetImageFromCurrentImageContext()

        

        UIGraphicsEndImageContext()

        

        return outputImage!

    }

}
