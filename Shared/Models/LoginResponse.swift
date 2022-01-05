//
//  LoginModel.swift
//  LoginTest (iOS)
//
//  Created by Atin Aganihotri on 05/01/22.
//

import Foundation

struct LoginResponse: Decodable {
    let token: UUID
    let fullName: String
}
