//
//  ReviewController.swift
//  Explore-BR
//
//  Created by Ederson on 13/11/21.
//

import Foundation


protocol ReviewControllerDelegate:AnyObject {
    func startLoading()
    func stopLoading()
    func failureValidateFields(error:ReviewErrorValidate?)
    func failureRequest(error:ReviewErrorRequest?)
    func sucessReview()
}

class ReviewController{
    
    private weak var delegate:ReviewControllerDelegate?
    public func delegate(delegate:ReviewControllerDelegate?){
        self.delegate = delegate
    }
    
    private func validateFields(title:String, review:String) -> ReviewErrorValidate? {
        if title == "" {
            self.delegate?.failureValidateFields(error: .invalidTitle)
        } else if review == "" {
            self.delegate?.failureValidateFields(error: .invalidReview)
        }
        return nil
    }
    
    public func saveReview(title:String, review:String, stars:Int){
        print("ENTROU NO SAVE")
        
        self.delegate?.startLoading()
        
        if let _error: ReviewErrorValidate = self.validateFields(title: title, review: review) {
            self.delegate?.failureValidateFields(error: _error)
            self.delegate?.stopLoading()
            return
        } else {
            ReviewWorker().sendReviewFirebase(title: title, review:review, stars:stars){ placeReview, error in
                if let _error = error {
                    self.delegate?.failureRequest(error: _error)
                    return
                }
                
                if let _ = placeReview{
                    self.delegate?.sucessReview()
                } else {
                    self.delegate?.failureRequest(error: error)
                }
                self.delegate?.stopLoading()
            }
        }
        
    }
    
}
