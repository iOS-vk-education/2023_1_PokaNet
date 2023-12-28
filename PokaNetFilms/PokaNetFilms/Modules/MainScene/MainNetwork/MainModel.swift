//
//  MainModel.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 26.12.23..
//

import Foundation


struct MainFilmResponse: Decodable {
    let docs: [MainFilm]
    let limit: Int
}


struct MainFilm: Decodable {
    let name: String
    let genres: [Genres]?
    let premiere: Premiere?
    let persons: [Persons]?
    let poster: Poster?
    let ageRating: Int
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
    let name: String
    let enProfession: String?
}

struct Poster: Decodable {
    let url: String
    let previewUrl: String?
}

