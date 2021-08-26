//
//  HomeVC.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 26/08/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var statusBackgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusBackgroundView.applyGradientInView(colors: [blueDarkButton,blueLightButton])
    }

}
