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
        let coordinator = RegistrationCoordinator()

        presenter.view = viewController
        presenter.coordinator = coordinator
        presenter.moduleOutput = moduleOutput
        
        return viewController
    }
}
