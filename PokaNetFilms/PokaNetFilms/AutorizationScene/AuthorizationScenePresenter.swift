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
}

extension AuthorizationPresenter: AuthorizationModuleInput {
}

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didLoadView() {
    }

    func didTapActionButton() {
    }
}

private extension AuthorizationPresenter {
    func fetchUnits() {
    }

    func mock() {
    }
}
