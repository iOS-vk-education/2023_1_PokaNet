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
        mock()
    }
    
    func didTapActionButton() {
        print(#function)
    }
}

private extension ProfilePresenter {
    func mock() {
        print(#function)
        let units: ProfileHeaderModel = .init(userName: "primmapola", email: "dongrigory29@gmail.com", avatar: "avatar")
        view?.configure(with: .init(units: units))
    }
}
