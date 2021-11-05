//
//  AuthErrors.swift
//  Explore-BR
//
//  Created by Samuel Brehm on 05/11/21.
//

import Foundation

public enum AuthErrors: Error {
    case errorServer
    case userNotExists
    case errorSignin
    case invalidData
}
