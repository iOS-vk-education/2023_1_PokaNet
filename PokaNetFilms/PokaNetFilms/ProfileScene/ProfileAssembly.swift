//
//  ProfileAssembly.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

final class ProfileAssembly {
    static func assembly(
        moduleOutput: ProfileModuleOutput? = nil
    ) -> UIViewController {
        let presenter = ProfilePresenter()
        let viewController = ProfileViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        return viewController
    }
}

