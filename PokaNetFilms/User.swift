//
//  User.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 27.12.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    extension User {
        static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Mary Miller", email: <#T##String#>)
    }
}
