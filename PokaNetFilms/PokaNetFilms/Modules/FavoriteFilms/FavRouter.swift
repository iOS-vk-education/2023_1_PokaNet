//
//  MainRouter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 04.12.2023.
//

import Foundation
import UIKit

final class FavRouter: BaseRouter {
}

extension FavRouter: FavRouterInput {
    func presentFilmView(movieID:Int) {
        let filmVC = FilmAssembly.assembly(movieID: movieID)
        let navigationController = UINavigationController(rootViewController: filmVC)
        presentFromSourceView(viewController: navigationController)
    }
}
