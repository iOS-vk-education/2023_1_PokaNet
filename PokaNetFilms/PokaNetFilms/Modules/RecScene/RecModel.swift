//
//  MainModel.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 26.12.23..
//

import Foundation


struct RecomendationFilmResponse: Decodable {
    let docs: [RecomendationFilm]
    let limit: Int
}


struct RecomendationFilm: Decodable {
    let name: String?
    let poster: Poster?
    let ageRating: Int?
    let id: Int
}


struct Genres: Decodable {
    let name: String
}

struct Premiere: Decodable {
    let world: String?
    let russia: String?
    let digital: String?
}

struct Persons: Decodable {
    let name: String?
    let enProfession: String?
}

struct Poster: Decodable {
    let url: String
    let previewUrl: String?
}

