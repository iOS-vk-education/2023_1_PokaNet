//
//  AuthorizationCoordinator.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 02.12.2023.
//

import Foundation
import UIKit

final class AuthorizationCoordinator {
    
    func presentRegistration(sourceView: UIViewController) {
        
        let regVC = RegistrationAssembly.assembly()
        regVC.modalPresentationStyle = .fullScreen
        sourceView.present(regVC, animated: true, completion: nil)
    }
}
