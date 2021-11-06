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
    
    enum CodingKeys:String,CodingKey{
        case id
        case name
        case email
    }
    
}
