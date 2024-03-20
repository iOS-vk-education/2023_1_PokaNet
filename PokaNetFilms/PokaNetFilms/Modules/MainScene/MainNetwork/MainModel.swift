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
    let name: String?
    let poster: MainPoster?
    let ageRating: Int?
    let id: Int
}


struct MainGenres: Decodable {
    let name: String
}

struct MainPremiere: Decodable {
    let world: String?
    let russia: String?
    let digital: String?
}

struct MainPersons: Decodable {
    let name: String?
    let enProfession: String?
}

struct MainPoster: Decodable {
    let url: String
    let previewUrl: String?
}

