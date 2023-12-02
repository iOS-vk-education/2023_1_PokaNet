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
    var coordinator: RegistrationCoordinator?
}

extension RegistrationPresenter: RegistrationModuleInput {
}

extension RegistrationPresenter: RegistrationViewOutput {
    func accountExistButtonTapped() {
        guard let sourceView = view as? UIViewController else {
            print("sourceView is not a UIViewController")
            return
        }
        
        coordinator?.presentAuthorization(sourceView: sourceView)
    }
    
    func didLoadView() {
        print(#function)
    }
}

private extension RegistrationPresenter {
}
