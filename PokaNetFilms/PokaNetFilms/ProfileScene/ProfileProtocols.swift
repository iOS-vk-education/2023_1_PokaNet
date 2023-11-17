//
//  ProfileProtocols.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation

protocol ProfileModuleInput {
    var moduleOutput: ProfileModuleOutput? { get }
}

protocol ProfileModuleOutput: AnyObject {
}

protocol ProfileViewInput: class {
    func configure(with models: ProfileViewModel)
}

protocol ProfileViewOutput: AnyObject {
    func didLoadView()
    func didTapActionButton()
}
