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
    func didTapEnterButton(email: String, password: String) {
        let loginRequest = LoginUserRequest(
            email: email,
            password: password
        )
        
        AuthService.shared.signIn(with: loginRequest) { [weak self] error in
            if (error != nil) {
                self?.view?.showError()
                return
            }
            self?.router?.openTabBar()
            //        if let error = error {
            //            AlertManager.showSignInErrorAlert(on: self, with: error)
            //            return
            //        }
            //
            //        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
            //            sceneDelegate.checkAuthentication()
        }
    }
    
    
    //    func didTapEnterButton() {
    //        router?.openTabBar()
    //    }
    
    func didTapRegistrationButton() {
        router?.openRegistration()
    }
    
    func didLoadView() {
    }
}

private extension AuthorizationPresenter {
}
