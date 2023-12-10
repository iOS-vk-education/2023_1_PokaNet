//
//  AuthorizationSceneProtocol.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 21.11.2023.
//

import Foundation
import UIKit

protocol AuthorizationModuleInput {
    var moduleOutput: AuthorizationModuleOutput? { get }
}

protocol AuthorizationModuleOutput: AnyObject {}

protocol AuthorizationViewInput: AnyObject {
}

protocol AuthorizationViewOutput: AnyObject {
    func didLoadView()
    func didTapRegistrationButton()
    func didTapEnterButton()
}

protocol AuthorizationRouterInput: BaseRouterInput {
    func openTabBar()
    func openRegistration()
}

