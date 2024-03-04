//
//  FavFilmsPresenter.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 29.02.2024.
//


import Foundation
import UIKit
import Kingfisher

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
        let favManager = FavManager.shared
        let likedArray: [Int] = UserDefaults.standard.array(forKey: "likedFilms") as? [Int] ?? [1]
        print(likedArray)
        var films: [DetailFilm] = []
        for id in likedArray {
            favManager.fetchData(id: id) { [weak self] result in
                switch result {
                case .success(let film):
                    films.append(film)
                    self?.updateUI(with: films)
                case .failure(let error):
                    print(error)
                }
            }
        }
        self.updateUI(with: films)
    }
    
    func updateUI(with films: [DetailFilm]) {
        var filmCells:[FavMovieCellModel] = []
        for film in films {
//            var filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
//            let imageUrlString = film.poster.url
//            if let imageUrl = URL(string: imageUrlString) {
//                if let imageData = try? Data(contentsOf: imageUrl) { //Kingfisher
//                    if let image = UIImage(data: imageData) {
//                        filmImage = image
//                    } else {
//                        print("Не удалось сконвертировать данные в изображение")
//                    }
//                } else {
//                    print("Не удалось загрузить данные по URL")
//                }
//            } else {
//                print("Некорректный URL")
//            }
            let filmImage = film.poster.url
            
            let filmName = film.name ?? "PokaNet"
            let ageRating = film.ageRating ?? 18
            var genres: String = ""
            for genre in film.genres {
                genres = genres + genre.name + " "
            }
            let color = UIColor(red: 0.07, green: 0.47, blue: 0.91, alpha: 1.00)
            
            let film: FavMovieCellModel =
                .init(id: film.id,
                      filmNameLabel: filmName,
                actorsLabel: "123",
                ageLabel: String(ageRating) + "+",
                dateLabel: "123",
                genreLabel: genres,
                priceLabel: "от 250₽",
                backgroundColor: color,
                filmImage: filmImage)
            filmCells.append(film)
        }
        
        let answer: FavViewModel = .init(films: filmCells)
        view?.configure(with: answer)
    }
}
