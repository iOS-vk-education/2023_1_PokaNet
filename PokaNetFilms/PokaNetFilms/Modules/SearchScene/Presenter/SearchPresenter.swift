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
    
    lazy var searchDebouncer: Debouncer = {
        return Debouncer(delay: 0.7) { [weak self] query in
            guard let query = query else { return }
            self?.performSearch(query: query)
        }
    }()
}

extension SearchPresenter {
    func convertToSearchFilmsModel(response: FilmResponse) -> [SearchFilmsModel] {
        return response.docs.map { film in
            
            let genresString = film.genres.map { $0.name }.joined(separator: " ")
            
            return SearchFilmsModel(title: film.name, genres: genresString, year: film.year)
        }
    }
    
    func performSearch(query: String) {
        SearchService.shared.searchFilms(query: query) { response in
            switch response {
            case .success(let films):
                let searchModels = self.convertToSearchFilmsModel(response: films)
                self.view?.configureSearch(with: searchModels)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension SearchPresenter: SearchModuleInput {}

extension SearchPresenter: SearchViewOutput {
    func didLoadView() {
    }
    
    func didChangeSearchText(_ searchText: String) {
        searchDebouncer.call(searchText)
    }
}

private extension SearchPresenter {}
