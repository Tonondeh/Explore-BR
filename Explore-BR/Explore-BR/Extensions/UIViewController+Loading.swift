//
//  BaseViewController.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation
import UIKit

fileprivate var loadingView: UIView?

extension UIViewController {
    func showSpinner() {
        loadingView = UIView(frame: self.view.bounds)
        loadingView?.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 0.3)
        
        let loadingSpinnerIndicator = UIActivityIndicatorView(style: .large)
        loadingSpinnerIndicator.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        loadingSpinnerIndicator.layer.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.75).cgColor
        loadingSpinnerIndicator.layer.cornerRadius = 9.0
        loadingSpinnerIndicator.color = UIColor(hex: "#1CB5E0")
        
        loadingSpinnerIndicator.center = loadingView?.center ?? CGPoint.init()
        loadingSpinnerIndicator.startAnimating()
        loadingView?.addSubview(loadingSpinnerIndicator)
        self.view.addSubview(loadingView ?? UIView())
    }
    
    func removeSpinner() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
}
