//
//  SearchVCViewController.swift
//  Explore-BR
//
//  Created by Lucas Munho on 25/08/21.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigationBar()

        
    }
    
    
    func configNavigationBar(){
        let layer0 = CAGradientLayer()

                

                layer0.colors = [

                    

                    UIColor(red: 0.204, green: 0.58, blue: 0.902, alpha: 1).cgColor,

                    

                    UIColor(red: 0.925, green: 0.431, blue: 0.678, alpha: 1).cgColor

                    

                ]
        if let colors = layer0.colors {
            self.navigationController?.navigationBar.setGradientBackground(colors: colors)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
