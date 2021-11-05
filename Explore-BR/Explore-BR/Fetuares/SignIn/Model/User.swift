//
//  User.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 22/09/21.
//

import Foundation
import FirebaseFirestoreSwift

struct User:Codable {
    let id:String
    let name: String?
    let email: String?
//    let password: String?
//    let latitude: Double?
//    let longitude: Double?
    
    enum CodingKeys:String,CodingKey{
        case id
        case name
        case email
//        case password
//        case latitude
//        case longitude
    }
    
}
