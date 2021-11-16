//
//  Controller.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 15/11/21.
//

import Foundation

private enum HeightCellBestReview: Float {
    case normalCell = 260
}

protocol BestReviewControllerDelegate: AnyObject {
    func failureRequest(error: ReviewErrors)
    func successRequest()
    func startLoading()
    func stopLoading()
}

class BestReviewController {
    private var listBestReviews: [BestReview]?
    
    private weak var delegate: BestReviewControllerDelegate?
    
    public func delegate(delegate: BestReviewControllerDelegate?) {
        self.delegate = delegate
    }
    
    public func getListBestReviews() -> [BestReview] {
        return self.listBestReviews ?? [BestReview()]
    }
    
    public func getHeightCell() -> Float {
        return HeightCellBestReview.normalCell.rawValue
    }
    
    public func getCountElement() -> Int {
        return self.listBestReviews?.count ?? 0
    }
    
    public func loadReviews() {
        self.delegate?.startLoading()
        ReviewWorker().loadReviews { bestReview, error in
            if let _error = error {
                self.delegate?.failureRequest(error: _error)
                self.delegate?.stopLoading()
                return
            }
            
            if let _bestReview = bestReview {
                self.listBestReviews = _bestReview
                self.delegate?.successRequest()
            } else {
                self.delegate?.failureRequest(error: .failsLoadList)
            }
            
            self.delegate?.stopLoading()
        }
    }
}
