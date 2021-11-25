//
//  PlaceDetail.swift
//  Explore-BR
//
//  Created by Ederson on 30/09/21.
//

import UIKit

/*
 struct PlaceDetail:Codable {
    var placeIid:String?
    var photo:UIImage?
    var name:String?
    var description:String?
    var quantityEvaluations:Int?
}
*/

// MARK: - PlaceList
struct PlaceDetail: Codable {
    var placeList: [PlaceList]?
}

// MARK: - PlaceList
struct PlaceList: Codable {
    var placeIid:String?
    var photo:UIImage?
    var name:String?
    var description:String?
    var quantityEvaluations:Int?
}

