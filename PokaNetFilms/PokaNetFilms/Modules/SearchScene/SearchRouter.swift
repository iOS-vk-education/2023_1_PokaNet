//
//  SearchSceneRouter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 28.12.2023.
//

import Foundation
import UIKit

final class SearchRouter: BaseRouter {
    
}

extension SearchRouter: SearchSceneRouterInput {
    
    func presentFilmView(movieID: Int) {
        let filmVC = FilmAssembly.assembly(movieID: movieID)
        let navigationController = UINavigationController(rootViewController: filmVC)
        presentFromSourceView(viewController: navigationController)
    }
}
