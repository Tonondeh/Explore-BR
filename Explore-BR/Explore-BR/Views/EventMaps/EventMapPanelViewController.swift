//
//  EventMapPanelViewController.swift
//  Explore-BR
//
//  Created by Eduardo Mizael on 27/09/21.
//

import UIKit

class EventMapPanelViewController: UIViewController {

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventDatelabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImage()
        // Do any additional setup after loading the view.
    }
    
    private func configImage(){
        self.eventImageView.layer.cornerRadius = 6.0
    }
            
}


