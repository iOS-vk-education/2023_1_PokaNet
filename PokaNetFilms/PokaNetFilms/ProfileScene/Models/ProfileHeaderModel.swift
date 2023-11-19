//
//  ProfileUnitModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import UIKit

struct ProfileHeaderModel {
    
    let userName: String
    let email: String
    let avatar: UIImage
    
    init(userName: String, email: String, avatar: UIImage) {
        self.userName = userName
        self.email = email
        self.avatar = avatar
    }
}

