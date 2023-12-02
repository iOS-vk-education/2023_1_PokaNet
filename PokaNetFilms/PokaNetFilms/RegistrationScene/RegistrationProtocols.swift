//
//  RegistrationProtocols.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation

protocol RegistrationModuleInput {
    var moduleOutput: RegistrationModuleOutput? { get }
}

protocol RegistrationModuleOutput: AnyObject {}

protocol RegistrationViewInput: AnyObject {}

protocol RegistrationViewOutput: AnyObject {
    func didLoadView()
    func accountExistButtonTapped()
}
