//
//  MainPresenter.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation
import UIKit

final class MainPresenter {
    
    weak var view: MainViewInput?
    weak var moduleOutput: MainModuleOutput?
    var router: MainRouterInput?
}

extension MainPresenter: MainModuleInput {}

extension MainPresenter: MainViewOutput {
    
    func didTapMovieCell(_ id: Int) {
        router?.presentFilmView(movieID: id)
    }
    
    func didLoadView() {
        loadData()
    }
}


private extension MainPresenter {
    
    func loadData() {
        let mainManager = MainManager.shared
        
        mainManager.searchFilms(page: 1, limit: 100) { result in
            switch result {
            case .success(let film):
                // Обработка успешного ответа
                print(film)
                self.updateUI(with: film)
            case .failure(let error):
                // Обработка ошибки
                print(error)
            }
        }
    }
    func updateUI(with film: MainFilmResponse) {
        
    
        let filmModels = film.docs.map { film in
            let color = UIColor(red: 0.07, green: 0.47, blue: 0.91, alpha: 1.00)
            let name = film.name
            
            let filmImage = film.poster!.url
            var actors: String = "актеры, бла бла"            
            return MainMovieCellModel(
                id: film.id,
                filmNameLabel: name ?? "PokaNet",
                actorsLabel: actors,
                ageLabel: String(
                    film.ageRating ?? 18
                ) + "+",
                dateLabel: "В кино",
                genreLabel: " ",
                priceLabel: "от 250₽",
                backgroundColor: color,
                filmImage: filmImage
            )
        }
        view?.configure(with: .init(films: filmModels))
    }
}
