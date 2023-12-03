//
//  AuthorizationScenePresenter.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 21.11.2023.
//

import Foundation
import UIKit

final class AuthorizationPresenter {
    weak var view: AuthorizationViewInput?
    weak var moduleOutput: AuthorizationModuleOutput?
    var router: AuthorizationRouter?
}

extension AuthorizationPresenter: AuthorizationModuleInput {
}

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didTapRegistrationButton() {
        let regVC = RegistrationAssembly.assembly()
        router?.dismiss(completion: {
            self.router?.presentFromSourceView(viewController: regVC)
        })
    }
    
    func didLoadView() {
    }
}

private extension AuthorizationPresenter {
}
