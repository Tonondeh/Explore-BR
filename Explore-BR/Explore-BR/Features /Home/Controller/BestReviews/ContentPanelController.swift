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
    private var listBestReviews: [Review]?
    private var listMoreLiked: [Review]?
    
    private weak var delegate: ContentPanelControllerDelegate?
    
    public func delegate(delegate: ContentPanelControllerDelegate?) {
        self.delegate = delegate
    }
    
    public func getListBestReviews() -> [Review] {
        return self.listMoreLiked ?? [Review()]
    }
    
    public func getListMoreLiked() -> [Review] {
        return self.listBestReviews ?? [Review()]
    }
    
    public func getHeightCell() -> Float {
        return HeightCellContentPanel.normalCell.rawValue
    }
    
    public func loadBestReviews(latitude: Double, longitude: Double) {
        self.delegate?.startLoading()
        ReviewsWorker().loadBestReviews(latitude: latitude, longitude: longitude) { bestReview, error in
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
    
    public func loadMoreLiked(latitude: Double, longitude: Double) {
        self.delegate?.startLoading()
        ReviewsWorker().loadMoreLiked(latitude: latitude, longitude: longitude) { bestReview, error in
            if let _error = error {
                self.delegate?.failureRequest(error: _error)
                self.delegate?.stopLoading()
                return
            }
            
            if let _bestReview = bestReview {
                self.listMoreLiked = _bestReview
                self.delegate?.successRequest()
            } else {
                self.delegate?.failureRequest(error: .failsLoadList)
            }
            
            self.delegate?.stopLoading()
        }
    }
}
