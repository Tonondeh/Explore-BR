//
//  AuthManager.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation

enum KeyUserDefaults: String {
    case userAuthenticated = "user_authenticated"
}

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}

    public func cacheUser(id: String) {
        UserDefaults.standard.setValue(id, forKey: KeyUserDefaults.userAuthenticated.rawValue)
    }

    public func getUserAuthenticated() -> String? {
        return UserDefaults.standard.string(forKey: KeyUserDefaults.userAuthenticated.rawValue)
    }
}
