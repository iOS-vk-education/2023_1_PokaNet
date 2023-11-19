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

protocol ProfileViewInput: AnyObject {
    func configureProfile(with model: ProfileViewModel?)
}

protocol ProfileViewOutput: AnyObject {
    func didLoadView()
    func didTapActionButton()
}
