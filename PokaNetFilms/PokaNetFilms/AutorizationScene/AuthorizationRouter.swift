//
//  AuthorizationCoordinator.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 02.12.2023.
//

import Foundation
import UIKit

final class AuthorizationRouter: BaseRouter {
}

extension AuthorizationRouter: AuthorizationRouterInput {
    func openRegistration() {
        let regVC = RegistrationAssembly.assembly()
        presentFromSourceView(viewController: regVC)
    }
    
    func openTabBar() {
        presentFromSourceView(viewController: TabBarController())
    }
}