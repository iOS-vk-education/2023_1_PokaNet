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
    
    private var currentQuery: String?
    private var page = 1
    private let limit = 10
    private var canRequestNext = true
    private var isLoading = false
    var totalResults = 0
    
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
            
            return SearchFilmsModel(title: film.name, genres: genresString, year: film.year, image: film.poster.url?.absoluteString ?? "")
        }
    }
    
    func performSearch(query: String) {
        SearchService.shared.searchFilms(query: query, page: page, limit: limit) { response in
            switch response {
            case .success(let films):
                let searchModels = self.convertToSearchFilmsModel(response: films)
                self.view?.configureSearch(with: searchModels)
                self.page += 1
                self.totalResults += self.limit
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func perforGenreSearch(genreName: String) {
        SearchService.shared.searchFilmsByGenre(genreName: genreName, page: page, limit: limit) { response in
            switch response {
            case .success(let films):
                let searchModels = self.convertToSearchFilmsModel(response: films)
                self.view?.configureSearchByGenre(with: searchModels)
                self.page += 1
                self.totalResults += self.limit
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }
        task.resume()
    }
}

extension SearchPresenter: SearchModuleInput {}

extension SearchPresenter: SearchViewOutput {
    func didLoadView() {
    }
    
    func resetPagination() {
        totalResults = 0
        page = 1
    }
    
    func didChangeSearchText(_ searchText: String) {
        searchDebouncer.call(searchText)
    }
    
    func didChooseGenre(genreName: String) {
        perforGenreSearch(genreName: genreName)
    }
    
    func willDisplayLastCell(_ query: String) {
        performSearch(query: query)
    }
}

private extension SearchPresenter {}
