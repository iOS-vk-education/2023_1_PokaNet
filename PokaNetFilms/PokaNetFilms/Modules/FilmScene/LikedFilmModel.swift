//
//  LikedFilmModel.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 29.02.2024.
//

import Foundation
import UIKit

struct LikedFilm {
    let id: Int
    let filmName: String
    var filmImage = UIImage()
    
    init(id: Int, filmName: String, filmImage: UIImage = UIImage()) {
        self.id = id
        self.filmName = filmName
        self.filmImage = filmImage
    }
}
