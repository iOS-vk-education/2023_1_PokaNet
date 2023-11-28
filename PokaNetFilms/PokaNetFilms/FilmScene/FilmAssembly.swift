//
//  FilmAssembly.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit

final class FilmAssembly {
    static func assembly(moduleOutput: FilmModuleOutput? = nil) -> UIViewController {
        let presenter = FilmPresenter()
        let viewController = FilmViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}
