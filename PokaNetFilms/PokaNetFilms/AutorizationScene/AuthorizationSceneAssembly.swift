//
//  AuthorizationSceneAssembly.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 21.11.2023.
//

import UIKit

final class AuthorizationAssembly {
    static func assembly(
        moduleOutput: AuthorizationModuleOutput? = nil
    ) -> UIViewController {
        let presenter = AuthorizationPresenter()
        let viewController = AuthorizationViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return viewController
    }
}
