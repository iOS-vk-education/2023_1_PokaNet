//
//  FavFilmsPresenter.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 29.02.2024.
//


import Foundation
import UIKit

final class FavPresenter {
    
    weak var view: FavViewInput?
    weak var moduleOutput: FavModuleOutput?
    var router: FavRouterInput?
}

extension FavPresenter: FavModuleInput {}

extension FavPresenter: FavViewOutput {
    
    func didTapMovieCell(_ id: Int) {
        router?.presentFilmView(movieID: id)
    }
    
    func didLoadView() {
        loadData()
    }
}


private extension FavPresenter {
    
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
            var actors: String = " "
            
            return FavMovieCellModel(
                id: film.id,
                filmNameLabel: name,
                actorsLabel: actors,
                ageLabel: String(
                    film.ageRating ?? 18
                ) + "+",
                dateLabel: " ",
                genreLabel: " ",
                priceLabel: "от 250₽",
                backgroundColor: color,
                filmImage: filmImage
            )
            
        }
        view?.configure(with: .init(films: filmModels))
    }
}