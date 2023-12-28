//
//  RecievedFilmModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 24.12.2023.
//

import Foundation

struct FilmResponse: Decodable {
    let docs: [Film]
    let limit: Int
}

struct Film: Decodable {
    let id: Int
    let name: String
    let genres: [GenresSearch]
    let year: Int
    let poster: PosterSearch
}

struct GenresSearch: Decodable {
    let name: String
}

struct PosterSearch: Decodable {
    let url: URL?
    let previewUrl: URL?
}
