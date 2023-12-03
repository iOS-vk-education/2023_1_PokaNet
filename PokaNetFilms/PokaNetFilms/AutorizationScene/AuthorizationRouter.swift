//
//  AuthorizationCoordinator.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 02.12.2023.
//

import Foundation
import UIKit

final class AuthorizationRouter: BaseRouter {
    func openRegistration() {
        let regVC = RegistrationAssembly.assembly()
        presentFromSourceView(viewController: regVC)
    }
}