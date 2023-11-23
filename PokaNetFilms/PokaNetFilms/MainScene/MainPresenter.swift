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

extension MainPresenter: MainModuleInput {
}
extension MainPresenter: MainViewOutput {
    func didLoadView() {
    }
    func didTapActionButton() {
    }
}

private extension MainPresenter {
    func mock() {
        
    }
}
