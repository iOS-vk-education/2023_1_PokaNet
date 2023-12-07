//
//  RegistrationAssembly.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation

import UIKit

final class RegistrationAssembly {
    static func assembly(
        moduleOutput: RegistrationModuleOutput? = nil) -> UIViewController {
        let presenter = RegistrationPresenter()
        let viewController = RegistrationViewController(output: presenter)
        let router = RegistrationRouter(sourceView: viewController)

        presenter.view = viewController
        presenter.router = router
        presenter.moduleOutput = moduleOutput
        
        return viewController
    }
}
