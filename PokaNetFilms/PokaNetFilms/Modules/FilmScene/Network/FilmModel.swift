//
//  DetailFilmModel.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 21.12.2023.
//

import Foundation


struct DetailFilm: Decodable {
    let id: Int
    let name: String
    let description: String
    let year: Int
    let genres: [Genres]
    let premiere: Premiere
    let countries: [Countries]
    let persons: [Persons?]
    let poster: Poster
    let rating: Rating
    let votes: Votes
    let seasonsInfo: [SeasonsInfo?]
    let movieLength: Int?
    let ageRating: Int
    let videos: Videos?
}

struct Videos: Decodable {
    let trailers: [Trailers]
}

struct Trailers: Decodable {
    let url: String
}
struct SeasonsInfo: Decodable {
    let number: Int
    let episodesCount: Int
}

struct Countries: Decodable {
    let name: String
}


struct Rating: Decodable {
    let kp: Double
}

struct Votes: Decodable {
    let kp: Int
}
