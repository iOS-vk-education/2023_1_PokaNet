//
//  RegistrationCoordinator.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 03.12.2023.
//

import Foundation
import UIKit

final class RegistrationRouter: BaseRouter {
}

extension RegistrationRouter: RegistrationRouterInput {
    func openAuthorization() {
        dismiss()
    }
}
