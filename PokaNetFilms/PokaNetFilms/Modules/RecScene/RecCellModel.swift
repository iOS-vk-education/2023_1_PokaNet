//
//  RecomendationMovieCellModel.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 20.03.2024.
//

import Foundation
import UIKit

struct RecomendationMovieCellModel {
    
    let id: Int
    let filmNameLabel: String
    let actorsLabel: String
    let ageLabel: String
    let dateLabel: String
    let genreLabel: String
    let priceLabel: String
    let backgroundColor: UIColor
    
    var filmImage: String
    
    init(id: Int, filmNameLabel: String, actorsLabel: String, ageLabel: String, dateLabel: String, genreLabel: String,
         priceLabel: String, backgroundColor: UIColor,filmImage: String) {
        self.filmNameLabel = filmNameLabel
        self.actorsLabel = actorsLabel
        self.ageLabel = ageLabel
        self.dateLabel = dateLabel
        self.genreLabel = genreLabel
        self.priceLabel = priceLabel
        self.backgroundColor = backgroundColor
        self.id = id
        self.filmImage = filmImage
    }
    
}

