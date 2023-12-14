//
//  MainRouter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 04.12.2023.
//

import Foundation
import UIKit

final class MainRouter: BaseRouter {
}

extension MainRouter: MainRouterInput {
    func presentFilmView() {
        let filmVC = FilmAssembly.assembly()
        presentFromSourceView(viewController: filmVC)
    }
}