//
//  ProfileFavouriteFilmsModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//
import Foundation
import UIKit

struct ProfileFavouriteFilmsModel {
    let id: Int
    let title: String
    var image = UIImage()
    
    init(id: Int, title: String, image: UIImage = UIImage()) {
        self.id = id
        self.title = title
        self.image = image
    }
}
