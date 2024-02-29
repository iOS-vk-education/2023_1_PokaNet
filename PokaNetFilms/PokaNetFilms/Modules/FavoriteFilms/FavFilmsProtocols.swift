//
//  MainProtocols.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation

protocol FavModuleInput {
    var moduleOutput: FavModuleOutput? { get }
}

protocol FavModuleOutput: AnyObject {
}

protocol FavViewInput: AnyObject {
    func configure(with models: FavViewModel)
}

protocol FavViewOutput: AnyObject {
    func didLoadView()
    func didTapMovieCell(_ id: Int)
}

protocol FavRouterInput: BaseRouterInput {
    func presentFilmView(movieID: Int)
}
