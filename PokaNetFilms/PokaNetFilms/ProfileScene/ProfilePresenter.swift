//
//  ProfilePresenter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation

final class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    weak var moduleOutput: ProfileModuleOutput?
    
}

extension ProfilePresenter: ProfileModuleInput {}

extension ProfilePresenter: ProfileViewOutput {
    func didLoadView() {
        print(#function)
    }
    
    func didTapActionButton() {
        print(#function)
    }
}
