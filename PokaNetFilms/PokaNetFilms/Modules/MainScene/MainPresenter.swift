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
    func didTapMovieCell() {
        router?.presentFilmView()
    }
    
    func didLoadView() {
        loadData()
    }
}


private extension MainPresenter {
    
    func loadData() {
        let mainManager = MainManager.shared
        
        mainManager.searchFilms(page: 1, limit: 10) { result in
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
        
        let filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
        
        let filmModels = film.docs.map { film in
            let color = UIColor.systemGray3
            let name = film.name
            var actors: String = "актеры, бла бла"
            let premiere = film.premiere?.russia ?? film.premiere?.digital ?? film.premiere?.world ?? "какая-то дата"
            if let persons = film.persons {
                for person in persons {
                    if person.enProfession == "actor" {
                        actors = actors + " " + String(person.name) + ", "
                    }
                }
            }
            return MainMovieCellModel(filmNameLabel: name,
                                      actorsLabel: actors,
                                      ageLabel: String(film.ageRating) + "+",
                                      dateLabel: "В кино с" + " " + premiere,
                                      genreLabel: " ",
                                      priceLabel: "от 250₽",
                                      backgroundColor: color,
                                      filmImage: filmImage)
            
        }
        view?.configure(with: .init(films: filmModels))
    }
}
