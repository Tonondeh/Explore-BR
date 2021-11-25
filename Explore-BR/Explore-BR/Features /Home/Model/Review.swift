//
//  BestReview.swift
//  Explore-BR
//
//  Created by Paulo Rodrigues on 18/09/21.
//

import Foundation

struct Review: Codable {
    var image: String?
    var title: String?
    var type: String?
    var region: String?
    var stars: [Int]?
    var latitude: Double?
    var longitude: Double?
}
