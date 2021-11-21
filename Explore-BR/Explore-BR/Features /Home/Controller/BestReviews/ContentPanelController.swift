//
//  Controller.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 15/11/21.
//

import Foundation

private enum HeightCellContentPanel: Float {
    case normalCell = 260
}

protocol ContentPanelControllerDelegate: AnyObject {
    func failureRequest(error: BestReviewErrors)
    func successRequest()
    func startLoading()
    func stopLoading()
}

class ContentPanelController {
    private var listBestReviews: [BestReview]?
    
    private weak var delegate: ContentPanelControllerDelegate?
    
    public func delegate(delegate: ContentPanelControllerDelegate?) {
        self.delegate = delegate
    }
    
    public func getListBestReviews() -> [BestReview] {
        return self.listBestReviews ?? [BestReview()]
    }
    
    public func getHeightCell() -> Float {
        return HeightCellContentPanel.normalCell.rawValue
    }
    
    public func getCountElement() -> Int {
        return self.listBestReviews?.count ?? 0
    }
    
    public func loadReviews(latitude: Double, longitude: Double) {
        self.delegate?.startLoading()
        BestReviewWorker().loadReviews(latitude: latitude, longitude: longitude) { bestReview, error in
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
