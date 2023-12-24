//
//  FilmPresenter.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit


final class FilmPresenter {
    weak var view : FilmViewInput?
    weak var moduleOutput: FilmModuleOutput?
    private var movieID: Int
    
    init(movieID: Int) {
        self.movieID = movieID
    }
}

extension FilmPresenter: FilmModuleOutput{}

extension FilmPresenter: FilmViewOutput{
    func didLoadView() {
        mock()
    }
}



private extension FilmPresenter {
        func mock() {
                let filmManager = FilmManager.shared

                filmManager.fetchData(id: movieID) { [weak self] result in
                    switch result {
                    case .success(let film):
                        // Обработка успешного ответа
                        print(film)
                        // Вместо явного вызова метода handleFetchedFilm, обработайте данные film здесь
                        // Например:
                        self?.updateUI(with: film)
                    case .failure(let error):
                        // Обработка ошибки
                        print(error)
                    }
                }
        }
        
        func updateUI(with film: DetailFilm) {
            let filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
            let film: FilmViewModel = .init(
                filmTitle: film.name,
                scoreLabel: String(film.rating.kp),
                scoreColor: UIColor(red: 0.46, green: 0.82, blue: 0.00, alpha: 1.00),
                kinopoiskScoreLabel: String(film.votes.kp),
                filmCountryLabel: "США",
                filmYearLabel: "2023",
                movieDetailsLabelTime: "1ч 45мин",
                movieDetailsLabelGenre: "биография комедия",
                movieDetailsLabelAge: "18+",
                filmDescriptionTextLabel: "Говорят, что миром правят деньги. А деньгами распоряжается Уолл-Стрит. И если на самом верху решили, что небольшая сеть магазинов видеоигр должна обанкротиться, то под это можно брать кредит в банке. Но однажды обычные люди сказали...Говорят, что миром правят деньги. А деньгами распоряжается Уолл-Стрит. И если на самом верху решили, что небольшая сеть магазинов видеоигр должна обанкротиться, то под это можно брать кредит в банке. Но однажды обычные люди сказали...",
                filmShowDateLabel: "20 ноября",
                filmAuthorNameLabel: "Федор Бондарчук",
                filmCastTextLabel: "Джейсон Флеминг, Декстер Флетчер, Ник Моран, Джейсон Стэйтем",
                filmImage: filmImage)
            
            view?.configure(with: film)
        }
}
