//
//  RegistrationCoordinator.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 03.12.2023.
//

import Foundation
import UIKit

final class RegistrationCoordinator {
    func presentAuthorization(sourceView: UIViewController) {
        let authVC = AuthorizationAssembly.assembly()
        authVC.modalPresentationStyle = .fullScreen
        
        sourceView.present(authVC, animated: true, completion: nil)
    }
}
