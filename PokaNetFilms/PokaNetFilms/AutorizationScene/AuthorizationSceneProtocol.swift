//
//  AuthorizationSceneProtocol.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 21.11.2023.
//

import Foundation

protocol AuthorizationModuleInput {
    var moduleOutput: AuthorizationModuleOutput? { get }
}

protocol AuthorizationModuleOutput: AnyObject {}

protocol AuthorizationViewInput: AnyObject {}

protocol AuthorizationViewOutput: AnyObject {
    func didLoadView()
    func didTapActionButton()
}

