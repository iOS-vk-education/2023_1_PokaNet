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
        
        mainManager.searchFilms(page: 1, limit: 10) { [weak self] result in
            switch result {
            case .success(let film):
                // Обработка успешного ответа
                print(film)
                self?.updateUI(with: film)
            case .failure(let error):
                // Обработка ошибки
                print(error)
            }
        }
    }
    func updateUI(with film: MainFilmResponse) {
        
        let filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
        
        let filmModels = film.docs.map { film in
            let color = UIColor.systemBlue
            let name = film.name
            var actors: String = ""
            let premiere = film.premiere.russia ?? film.premiere.digital ?? film.premiere.world ?? ""
            for person in film.persons {
                if person.enProfession == "actor" {
                    actors = actors + " " + String(person.name) + ", "
                }
            }
            
            return MainMovieCellModel(filmNameLabel: name,
                                      actorsLabel: actors,
                                      ageLabel: String(film.ageRating),
                                      dateLabel: "В кино с" + " " + premiere,
                                      genreLabel: " ",
                                      priceLabel: " ",
                                      backgroundColor: color,
                                      filmImage: filmImage)
            
        }
        view?.configure(with: .init(films: filmModels))
    }
}
