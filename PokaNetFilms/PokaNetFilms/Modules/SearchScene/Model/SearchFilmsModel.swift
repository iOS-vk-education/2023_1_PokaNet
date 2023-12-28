//
//  SearchViewModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation

struct SearchFilmsModel {
    let id: Int
    let title: String
    let genres: String
    let year: Int
    let image: String
    
    init(id: Int, title: String, genres: String, year: Int, image: String) {
        self.id = id
        self.title = title
        self.genres = genres
        self.year = year
        self.image = image
    }
}

enum GenreToSearch: String, CaseIterable {
    case anime = "аниме"
    case biography = "биография"
    case action = "боевик"
    case western = "вестерн"
    case military = "военный"
    case detective = "детектив"
    case children = "детский"
    case adult = "для взрослых"
    case documentary = "документальный"
    case drama = "драма"
    case game = "игра"
    case history = "история"
    case comedy = "комедия"
    case concert = "концерт"
    case short = "короткометражка"
    case crime = "криминал"
    case melodrama = "мелодрама"
    case music = "музыка"
    case cartoon = "мультфильм"
    case musical = "мюзикл"
    case news = "новости"
    case adventure = "приключения"
    case realityTV = "реальное ТВ"
    case family = "семейный"
    case sport = "спорт"
    case talkShow = "ток-шоу"
    case thriller = "триллер"
    case horror = "ужасы"
    case fantasy = "фантастика"
    case filmNoir = "фильм-нуар"
    case fantasyGenre = "фэнтези"
    case ceremony = "церемония"
}
