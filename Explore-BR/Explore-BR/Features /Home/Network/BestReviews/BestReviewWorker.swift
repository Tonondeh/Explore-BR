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

class BestReviewWorker {
    private var mockListReviews: [BestReview] = [
        BestReview(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        BestReview(image: "location-detail", title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        BestReview(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869),
        BestReview(image: "location-detail", title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2, 5, 2, 4, 1], latitude: -22.9035393, longitude: -43.2095869)
    ]
    
    func loadReviews(latitude: Double, longitude: Double, completion: @escaping (_ bestReview: [BestReview]?, _ error: BestReviewErrors?) -> Void) {
        let result = true
        
        if result {
            completion(mockListReviews, nil)
        } else {
            completion(nil, .failGetRequestServer)
        }
    }
}
