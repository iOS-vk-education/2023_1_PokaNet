//
//  FilmAssembly.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit

final class FilmAssembly {
    static func assembly(movieID: Int, moduleOutput: FilmModuleOutput? = nil) -> UIViewController {
        let presenter = FilmPresenter(movieID: movieID)
        let viewController = FilmViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
