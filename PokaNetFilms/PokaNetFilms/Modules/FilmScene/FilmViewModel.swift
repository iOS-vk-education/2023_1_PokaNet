//
//  FilmViewModel.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 27.11.2023.
//

import UIKit
import Foundation

struct FilmViewModel {
    let filmTitle: String
    let scoreLabel: String
    let scoreColor: UIColor
    let kinopoiskScoreLabel: String
    let filmCountryLabel: String
    let filmYearLabel: String
    let movieDetailsLabelTime: String
    let movieDetailsLabelGenre: String
    let movieDetailsLabelAge: String
    let filmDescriptionTextLabel:String
    let filmShowDateLabel: String
    let filmAuthorNameLabel: String
    let filmCastTextLabel: String
    let videoUrl: String
    let id: Int
    let itSerial: Bool
    var filmImage = UIImage()
    
    init(filmTitle: String, scoreLabel: String, scoreColor: UIColor, kinopoiskScoreLabel: String, filmCountryLabel: String, filmYearLabel: String, movieDetailsLabelTime: String, movieDetailsLabelGenre: String, movieDetailsLabelAge: String, filmDescriptionTextLabel:String, filmShowDateLabel: String, filmAuthorNameLabel: String, filmCastTextLabel: String, filmImage: UIImage, videoUrl: String, id: Int, itSerial: Bool) {
        self.filmTitle = filmTitle
        self.scoreLabel = scoreLabel
        self.scoreColor = scoreColor
        self.kinopoiskScoreLabel = kinopoiskScoreLabel
        self.filmCountryLabel = filmCountryLabel
        self.filmYearLabel = filmYearLabel
        self.movieDetailsLabelTime = movieDetailsLabelTime
        self.movieDetailsLabelGenre = movieDetailsLabelGenre
        self.movieDetailsLabelAge = movieDetailsLabelAge
        self.filmDescriptionTextLabel = filmDescriptionTextLabel
        self.filmShowDateLabel = filmShowDateLabel
        self.filmAuthorNameLabel = filmAuthorNameLabel
        self.filmCastTextLabel = filmCastTextLabel
        self.filmImage = filmImage
        self.videoUrl = videoUrl
        self.id = id
        self.itSerial = itSerial
    }
    
}
