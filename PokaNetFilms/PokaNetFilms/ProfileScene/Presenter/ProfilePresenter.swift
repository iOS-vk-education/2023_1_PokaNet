//
//  ProfilePresenter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

final class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    weak var moduleOutput: ProfileModuleOutput?
    
}

extension ProfilePresenter: ProfileModuleInput {}

extension ProfilePresenter: ProfileViewOutput {
    func didLoadView() {
        mock()
    }
    
    func didTapActionButton() {
    }
}

private extension ProfilePresenter {
    func mock() {
        let avatarImage = UIImage(named: "avatar") ?? UIImage(named: "defaultImage")!
        
        let profileModel: ProfileHeaderModel = .init(userName: "primmapola", email: "dongrigory29@gmail.com", avatar: avatarImage)
        
        let filmImage = UIImage(named: "nilName") ?? UIImage(named: "defaultImage")!
        
        let filmsModel: [ProfileFavouriteFilmsModel] = [
            .init(title: "1", image: filmImage),
            .init(title: "2", image: filmImage),
            .init(title: "3", image: filmImage),
            .init(title: "4", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "6", image: filmImage)
        ]
        
        view?.configureProfile(with: .init(profile: profileModel, favoriteFilms: filmsModel))
    }
}

