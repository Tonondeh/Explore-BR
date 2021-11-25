//
//  ReviewWorker.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 15/11/21.
//

import Foundation

enum BestReviewErrors: Error {
    case failGetRequestServer
    case failsLoadList
}

class ReviewsWorker {
    private var mockListBestReviews: [Review] = [
        Review(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Regiao 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Regiao 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869)
    ]
    
    private var mockListMoreLiked: [Review] = [
        Review(image: "SearchImage", title: "Guarujá", type: "Praia", region: "Região 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "SearchImage", title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "SearchImage", title: "Guarujá", type: "Praia", region: "Região 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        Review(image: "SearchImage", title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869)
    ]
    
    func loadBestReviews(latitude: Double, longitude: Double, completion: @escaping (_ bestReview: [Review]?, _ error: BestReviewErrors?) -> Void) {
        let result = true
        
        if result {
            completion(mockListBestReviews, nil)
        } else {
            completion(nil, .failGetRequestServer)
        }
    }
    
    func loadMoreLiked(latitude: Double, longitude: Double, completion: @escaping (_ bestReview: [Review]?, _ error: BestReviewErrors?) -> Void) {
        let result = true
        
        if result {
            completion(mockListMoreLiked, nil)
        } else {
            completion(nil, .failGetRequestServer)
        }
    }
}
