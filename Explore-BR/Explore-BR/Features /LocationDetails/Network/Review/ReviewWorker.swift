//
//  ReviewWorker.swift
//  Explore-BR
//
//  Created by Ederson on 13/11/21.
//

import Foundation

public enum ReviewErrorRequest:Error {
    case errorServer
    case userNotExists
    case errorSignin
}

public enum ReviewErrorValidate:Error {
    case invalidTitle
    case invalidReview
}

class ReviewWorker{
    
    public func sendReviewFirebase(title: String, review:String, stars:Int, completion:@escaping(_ sucess: PlaceReview?, _ error: ReviewErrorRequest?) -> Void ){
        if true {
            let placeReview = PlaceReview(reviewImage: "SearchImage", name: "Place 01", title: "Title 01", review: "Review 01", stars: 5)
            completion(placeReview, nil)
            return
        } else {
            completion(nil, .errorServer)
            return 
        }
        
    }
    
}
