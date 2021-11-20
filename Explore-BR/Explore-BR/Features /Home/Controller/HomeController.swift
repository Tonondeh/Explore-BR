//
//  HomeController.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 20/11/21.
//

import Foundation

protocol HomeControllerDelegate: AnyObject {
    func startLoading()
    func stopLoading()
}

class HomeController {
    
    private var contentPanelVC: ContentPanelVC?
    
    private weak var delegate: HomeControllerDelegate?
    
    public func delegate(delegate: HomeControllerDelegate?) {
        self.delegate = delegate
    }
    
    public func createContentPanelVC() -> ContentPanelVC {
        self.contentPanelVC = ContentPanelVC()
        if let _contentPavelVC = self.contentPanelVC {
            return _contentPavelVC
        } else {
            return ContentPanelVC()
        }
    }
    
    public func setLocationUser(latitude: Double, longitude: Double) {
        print("HomeController >> latitude ", latitude)
        print("HomeController >> longitude ", longitude)
    }
}
