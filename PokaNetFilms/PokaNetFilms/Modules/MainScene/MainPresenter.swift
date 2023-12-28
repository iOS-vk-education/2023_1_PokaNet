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
        router?.presentFilmView(movieID: 666)
    }
    // 5304403 - Слово пацана, 666 - Форсаж, 555 - Лебовски , 4917532 - Дурные деньги
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
        
    
        let filmModels = film.docs.map { film in
            let color = UIColor(red: 0.07, green: 0.47, blue: 0.91, alpha: 1.00)
            let name = film.name
            let premiere = film.premiere?.russia ?? film.premiere?.digital ?? film.premiere?.world ?? ""
            var filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
            let imageUrlString = film.poster!.url
            if let imageUrl = URL(string: imageUrlString) {
                if let imageData = try? Data(contentsOf: imageUrl) { //Kingfisher
                    if let image = UIImage(data: imageData) {
                        filmImage = image
                    } else {
                        print("Не удалось сконвертировать данные в изображение")
                    }
                } else {
                    print("Не удалось загрузить данные по URL")
                }
            } else {
                print("Некорректный URL")
            }
            var actors: String = "актеры, бла бла"
            for person in film.persons {
                if person.enProfession == "actor"{
                    actors = actors + " " + String(person.name) + ", "
                }
            }
            actors.removeFirst()
            actors.removeLast()
            actors.removeLast()
            
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
