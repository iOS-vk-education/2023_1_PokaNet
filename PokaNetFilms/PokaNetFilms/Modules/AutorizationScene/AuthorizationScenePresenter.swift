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
    var router: AuthorizationRouterInput?
}

extension AuthorizationPresenter: AuthorizationModuleInput {
}

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didTapEnterButton() {
        router?.openTabBar()
    }
    
    func didTapRegistrationButton() {
        router?.openRegistration()
    }
    
    func didLoadView() {
    }
}

private extension AuthorizationPresenter {
}
