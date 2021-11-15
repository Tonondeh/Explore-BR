//
//  Places.swift
//  Explore-BR
//
//  Created by Lucas Munho on 13/09/21.
//

import UIKit
import Foundation

struct PlaceGoogleResponse: Codable {
    let businessStatus: String?
//    let geometry: Geometry?
    let icon: String?
    let iconBackgroundColor: String?
    let iconMaskBaseURI: String?
    let name: String?
    let photos: [String]?
    let placeID: String?
    let rating: Double?
    let reference, scope: String?
    let types: [String]?
    let userRatingsTotal: Int?
    let vicinity: String?

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
//        case geometry,
        case icon
        case iconBackgroundColor = "icon_background_color"
        case iconMaskBaseURI = "icon_mask_base_uri"
        case name
        case photos
        case placeID = "place_id"
        case rating, reference, scope, types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}

struct Place {
    let name:String?
    var placeButtonEnable:Bool?
    var image:UIImage?
    var localType:String?
    var local:String?
    var description:String?
    var heartIconEnable:Bool?
    var heartIcon:UIImage?
    var star:Double?
    var icon:UIImage?
    var address:String?
    var id:String
}
