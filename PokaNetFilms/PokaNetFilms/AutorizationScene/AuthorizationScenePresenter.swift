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
    var coordinator: AuthorizationCoordinator?
}

extension AuthorizationPresenter: AuthorizationModuleInput {
}

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didTapRegistrationButton() {
        guard let sourceView = view as? UIViewController else {
            print("sourceView is not a UIViewController")
            return
        }
        coordinator?.presentRegistration(sourceView: sourceView)
    }
    
    func didLoadView() {
    }
}

private extension AuthorizationPresenter {
}
