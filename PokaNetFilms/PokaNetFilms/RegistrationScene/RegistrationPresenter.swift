//
//  RegistrationPresenter.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation
import UIKit

final class RegistrationPresenter {
    weak var view: RegistrationViewInput?
    weak var moduleOutput: RegistrationModuleOutput?
    var router: RegistrationRouter?
}

extension RegistrationPresenter: RegistrationModuleInput {
}

extension RegistrationPresenter: RegistrationViewOutput {
    func accountExistButtonTapped() {
        let authVC = AuthorizationAssembly.assembly()
        router?.dismiss {
            self.router?.presentFromSourceView(viewController: authVC)
        }
    }
    
    func didLoadView() {
        print(#function)
    }
}

private extension RegistrationPresenter {
}
