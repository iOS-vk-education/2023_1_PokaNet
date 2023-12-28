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

protocol RegistrationViewInput: AnyObject {
    func showError()
}

protocol RegistrationViewOutput: AnyObject {
    func registButtonTapped(name: String, email: String, password: String, passconf: String)
    func didLoadView()
    func accountExistButtonTapped()
}

protocol RegistrationRouterInput: BaseRouterInput {
    func openTabBar()
    func openAuthorization()
}

