//
//  SearchPresenter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation
import UIKit

final class SearchPresenter {
    
    weak var view: SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?
    var films: [SearchFilmsModel] = [
        SearchFilmsModel(title: "123", genres: [.action, .adventure], year: 2002),
        SearchFilmsModel(title: "Bird", genres: [.animation, .anime], year: 2018),
        SearchFilmsModel(title: "Rat", genres: [.biography, .children, .comedy], year: 2015)
    ]
    
}

extension SearchPresenter: SearchModuleInput {}

extension SearchPresenter: SearchViewOutput {
    func didLoadView() {
    }
    
    func didChangeSearchText(_ searchText: String) {
        let filteredFilms = filterFilms(searchText)
        view?.configureSearch(with: filteredFilms ?? [])
    }
}

private extension SearchPresenter {
    func filterFilms(_ searchText: String) -> [SearchFilmsModel]? {
        return films.filter { $0.title.contains(searchText) }
    }
}
