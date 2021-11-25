//
//  HomeController.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 20/11/21.
//

import Foundation

protocol HomeControllerDelegate: AnyObject {
    func successFindUser(user: User)
    func failureFindUser(error: AuthErrors)
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
        self.contentPanelVC?.setLocationUser(latitude: latitude, longitude: longitude)
    }
    
    public func getUserAuthenticated() {
        guard let userId: String = AuthManager.shared.getUserAuthenticated() else {
            self.delegate?.failureFindUser(error: .emptyIdUSer)
            return
        }
        
        self.delegate?.startLoading()
        
        HomeWorker().getUserFirebase(id: userId) { user, error in
            if let _error = error {
                self.delegate?.failureFindUser(error: _error)
                self.delegate?.stopLoading()
                return
            }
            
            if let _user = user {
                self.delegate?.successFindUser(user: _user)
            } else {
                self.delegate?.failureFindUser(error: .userNotExists)
            }
            self.delegate?.stopLoading()
        }
    }
}
