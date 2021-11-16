//
//  ReviewWorker.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 15/11/21.
//

import Foundation

enum ReviewErrors: Error {
    case failGetRequestServer
    case failsLoadList
}

class ReviewWorker {
    private var mockListReviews: [BestReview] = [
        BestReview(image: "location-detail", title: "Pernambuco", type: "Cidade", region: "Região 1", stars: [2, 5, 2, 4, 1]),
        BestReview(image: "location-detail", title: "Guarujá", type: "Praia", region: "Regiao 2", stars: [2, 5, 2, 4, 1])
    ]
    
    func loadReviews(completion: @escaping (_ bestReview: [BestReview]?, _ error: ReviewErrors?) -> Void) {
        let result = true
        
        if result {
            completion(mockListReviews, nil)
        } else {
            completion(nil, .failGetRequestServer)
        }
    }
}
