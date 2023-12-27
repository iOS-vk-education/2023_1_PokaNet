//
//  SearchViewModel.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation

struct SearchFilmsModel {
    let title: String
    let genres: String
    let year: Int
    let image: URL
    
    init(title: String, genres: String, year: Int, image: URL) {
        self.title = title
        self.genres = genres
        self.year = year
        self.image = image
    }
}

enum GenreToSearch: String, CaseIterable {
    case comedy = "Комедии"
    case animation = "Мультфильмы"
    case horror = "Ужасы"
    case scienceFiction = "Фантастика"
    case thriller = "Триллеры"
    case action = "Боевики"
    case romance = "Мелодрамы"
    case crime = "Детективы"
    case adventure = "Приключения"
    case fantasy = "Фэнтези"
    case war = "Военные"
    case family = "Семейные"
    case anime = "Аниме"
    case historical = "Исторические"
    case drama = "Драмы"
    case documentary = "Документальные"
    case children = "Детские"
    case criminal = "Криминал"
    case biography = "Биографии"
    case western = "Вестерны"
    case filmNoir = "Фильмы-нуар"
    case sports = "Спортивные"
    case realityTV = "Реальное ТВ"
    case shortFilm = "Короткометражки"
    case music = "Музыкальные"
    case musical = "Мюзиклы"
    case talkShow = "Ток-шоу"
    case game = "Игры"
}
