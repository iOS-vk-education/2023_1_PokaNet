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
    var router: RegistrationRouterInput?
}

extension RegistrationPresenter: RegistrationModuleInput {
}

extension RegistrationPresenter: RegistrationViewOutput {
    
    func registButtonTapped(name: String, email: String, password: String, passconf: String) {
        let registRequest = RegiserUserRequest(
            name: name,
            email: email,
            password: password,
            passconf: passconf
        )
        
        UserDefaults.standard.set(name, forKey: "nameKey")
        UserDefaults.standard.set(email, forKey: "emailKey")
        
        AuthService.shared.registerUser(with: registRequest) { [weak self] wasregistered, error in
            if (error != nil) {
                self?.view?.showError()
                return
            }
            
            if wasregistered {
                self?.router?.openTabBar()
            }
        }
    }
    func accountExistButtonTapped() {
        router?.openAuthorization()
    }
    
    func didLoadView() {
        print(#function)
    }
}

private extension RegistrationPresenter {
}
