//
//  UserRegister.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation

import FirebaseFirestoreSwift

struct UserRegister: Codable {
    let id:String
    let name: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
    
    }
    
}
