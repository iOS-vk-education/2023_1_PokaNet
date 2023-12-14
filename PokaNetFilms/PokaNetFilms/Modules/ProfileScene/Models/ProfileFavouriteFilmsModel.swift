//
//  ProfileFavouriteFilmsModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

import Foundation
import UIKit

struct ProfileFavouriteFilmsModel {
    
    let title: String
    let image: UIImage
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
}
