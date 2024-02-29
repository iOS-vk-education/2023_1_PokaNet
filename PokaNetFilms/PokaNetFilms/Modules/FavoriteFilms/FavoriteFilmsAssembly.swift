//
//  FavoriteFilmsAssembly.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 29.02.2024.
//

import Foundation
import UIKit

final class FavAssembly {
    static func assembly(
        moduleOutput: FavModuleOutput? = nil
    ) -> UIViewController {
        let presenter = FavPresenter()
        let viewController = FavoriteFilmsViewController(output: presenter)
        let router = FavRouter(sourceView: viewController)

        presenter.router = router
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
