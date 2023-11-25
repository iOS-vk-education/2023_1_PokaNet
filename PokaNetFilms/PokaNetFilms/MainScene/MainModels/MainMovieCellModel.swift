//
//  MainUnitModel.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import UIKit

struct MainMovieCellModel {
    
    let filmNameLabel: String
    let actorsLabel: String
    let ageLabel: String
    let dateLabel: String
    let genreLabel: String
    let priceLabel: String
    let backgroundColor: UIColor
    
    var filmImage = UIImage()
    
    init(filmNameLabel: String, actorsLabel: String, ageLabel: String, dateLabel: String, genreLabel: String,
         priceLabel: String, backgroundColor: UIColor,filmImage: UIImage) {
        self.filmNameLabel = filmNameLabel
        self.actorsLabel = actorsLabel
        self.ageLabel = ageLabel
        self.dateLabel = dateLabel
        self.genreLabel = genreLabel
        self.priceLabel = priceLabel
        self.backgroundColor = backgroundColor
        
        self.filmImage = filmImage
    }
    
}

