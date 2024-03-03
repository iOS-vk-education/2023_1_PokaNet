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
        loadData()
    }
}



private extension FilmPresenter {
        func loadData() {
                let filmManager = FilmManager.shared

                filmManager.fetchData(id: movieID) { [weak self] result in
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
        
        func updateUI(with film: DetailFilm) {
            var filmImage = UIImage(named: "filmImage") ?? UIImage(named: "defaultImage")!
            let imageUrlString = film.poster.url
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
            
            var casts: String = ""
            var authors: String = ""
            if let filmPersons = film.persons {
                for person in filmPersons {
                    if person?.enProfession == "director"{
                        authors = authors + " " + String(person?.name ?? "PokaNet") + ", "
                    }
                    if person?.enProfession == "actor"{
                        casts = casts + " " + String(person?.name ?? "PokaNet") + ", "
                    }
                }
                casts.removeFirst()
                casts.removeLast()
                casts.removeLast()
                authors.removeFirst()
                authors.removeLast()
                authors.removeLast()
            } else {
                casts = "PokaNet casts"
                authors = "PokaNet authors"
            }
            
            
            var genres: String = ""
            for genre in film.genres {
                genres = genres + genre.name + " "
            }
            var itSerial = false
            let movieLength = film.movieLength ?? Int(100)
            var movieTime: String
            if movieLength != 100 {
                let hours: Int = movieLength / 60
                let minutes: Int = movieLength % 60
                movieTime = "\(hours)ч \(minutes)мин"
            }
            else if film.seasonsInfo.count != 0 {
                    movieTime = "Количество серий: " + "\(film.seasonsInfo[0]!.episodesCount)"
                    itSerial = true
            }
            else {
                movieTime = "1ч 45мин"
            }
            
            let showDate = film.premiere.russia ?? film.premiere.digital ?? film.premiere.russia ?? String("Не указана дата премьеры")
            let filmDate = setupFilmDate(date: showDate)
            let url = film.videos?.trailers[0].url
            let score = (film.rating.kp * 10).rounded() / 10
            let color: UIColor
            if score > 8 {
                color = UIColor(red: 0.46, green: 0.82, blue: 0.00, alpha: 1.00) // зеленый
            } else if score >= 6 {
                color = UIColor(red: 0.09, green: 0.42, blue: 0.09, alpha: 1.00) // темно зеленый
            } else if score >= 4 {
                color = UIColor(red: 0.99, green: 0.62, blue: 0.00, alpha: 1.00) // желтый
            } else if score >= 2 {
                color = UIColor(red: 1.00, green: 0.24, blue: 0.06, alpha: 1.00) // оранжевый
            } else {
                color = UIColor(red: 0.62, green: 0.08, blue: 0.04, alpha: 1.00) // красный
            }
            let name = film.name ?? "PokaNet"
            
            let film: FilmViewModel = .init(
                filmTitle: name,
                scoreLabel: String(score),
                scoreColor: color,
                kinopoiskScoreLabel: String(film.votes.kp),
                filmCountryLabel: film.countries[0].name,
                filmYearLabel: String(film.year),
                movieDetailsLabelTime: movieTime,
                movieDetailsLabelGenre: genres,
                movieDetailsLabelAge: String(film.ageRating ?? 18) + "+",
                filmDescriptionTextLabel: film.description,
                filmShowDateLabel: filmDate,
                filmAuthorNameLabel: authors,
                filmCastTextLabel: casts,
                filmImage: filmImage, 
                videoUrl: url ?? "noFilm",
                id: film.id,
                itSerial: itSerial
            )
            

            view?.configure(with: film)
        }
        
    func setupFilmDate(date:String) -> String{
        var filmDate = date
        if filmDate.count >= 14 {
            let endIndex = filmDate.index(filmDate.endIndex, offsetBy: -14)
            filmDate = String(filmDate[..<endIndex])
        }
        return filmDate
    }
}
