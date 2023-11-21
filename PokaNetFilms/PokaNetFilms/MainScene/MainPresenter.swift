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
        print(#function)
        mock()
    }

    func didTapActionButton() {
        print(#function)
    }
}

private extension MainPresenter {
    func mock() {
        print(#function)
        let units: MainUnitModel = .init(title: "Сегодня в кино", reuseIdentifier: "Cell Identifier", cellText: "aboba")
        view?.configure(with: .init(units: units))
    }
}
