//
//  MainPresenter.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation

final class MainPresenter {

    weak var view: MainViewInput?
    weak var moduleOutput: MainModuleOutput?

}

extension MainPresenter: MainModuleInput {}

extension MainPresenter: MainViewOutput {
    
    func didLoadView() {
    }

    func didTapActionButton() {
    }
}

private extension MainPresenter {
    func mock() {
        let units: MainMovieCellModel = .init(title: "Сегодня в кино", reuseIdentifier: "Cell Identifier", cellText: "aboba")
        view?.configure(with: .init(units: units))
    }
}
