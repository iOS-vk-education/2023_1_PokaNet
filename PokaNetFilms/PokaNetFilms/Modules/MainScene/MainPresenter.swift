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
        router?.presentFilmView(movieID: 555)
    }
    // 5304403 - Слово пацана, 666 - Форсаж, 555 - Лебовски , 4917532 - Дурные деньги
    func didLoadView() {
        mock()
    }
}


private extension MainPresenter {
    func mock() {
        let moneyImage = UIImage(named: "moneyImage") ?? UIImage(named: "defaultImage")!
        let baikalImage = UIImage(named: "baikalImage") ?? UIImage(named: "defaultImage")!
        let daughterImage = UIImage(named: "daughterImage") ?? UIImage(named: "defaultImage")!
        let disasterImage = UIImage(named: "disasterImage") ?? UIImage(named: "defaultImage")!
        
        
        let films: [MainMovieCellModel] = [
            
            .init(filmNameLabel: "Дурные деньги",
                  actorsLabel: "Пол Дано, Пит Девидсон, Америка Ферерра, Себастиан Стэн",
                  ageLabel: "18+",
                  dateLabel: "С 20 ноября",
                  genreLabel: "биография, комедия, история",
                  priceLabel: "от 300 ₽",
                  backgroundColor: UIColor(red: 0.79, green: 0.75, blue: 0.52, alpha: 1.00),
                  filmImage: moneyImage),
            
            
                .init(filmNameLabel: "Дух Байкала",
                      actorsLabel: "Илья Рязанов, Мосэ Куртанидзе, Олег Бабуев, Анастасия цветкова, Диана Анкудинова",
                      ageLabel: "12+",
                      dateLabel: "С 19 октября",
                      genreLabel: "приключения, драма",
                      priceLabel: "от 200 ₽",
                      backgroundColor: UIColor(red: 0.52, green: 0.68, blue: 0.79, alpha: 1.00),
                      filmImage: baikalImage),
            
            
                .init(filmNameLabel: "Дочь болотного царя",
                      actorsLabel: "Дейзи Ридли, Бен Мендельсон, Бруклин Принс, Гил Бирмингем",
                      ageLabel: "18+",
                      dateLabel: "С 28 сентября",
                      genreLabel: "биография, комедия, история",
                      priceLabel: "от 350 ₽",
                      backgroundColor: UIColor(red: 0.37, green: 0.51, blue: 0.09, alpha: 1.00),
                      filmImage: daughterImage),
            
            
                .init(filmNameLabel: "Катастрофа",
                      actorsLabel: "Артур Сардарян, Олег Гибадулин, Константин Кулаков, Павел Дуров",
                      ageLabel: "18+",
                      dateLabel: "С 9 ноября",
                      genreLabel: "биография, комедия, драма",
                      priceLabel: "от 250 ₽",
                      backgroundColor: UIColor(red: 0.17, green: 0.31, blue: 0.39, alpha: 1.00),
                      filmImage: disasterImage)
        ]
        
        view?.configure(with: .init(films: films))
    }
}
