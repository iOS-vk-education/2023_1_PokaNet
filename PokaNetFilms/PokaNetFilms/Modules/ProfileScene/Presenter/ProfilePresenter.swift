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
}

private extension ProfilePresenter {
    func mock() {
//        
//
//        
        let filmImage = UIImage(named: "nilName") ?? UIImage(named: "defaultImage")!
        
        let filmsModel: [ProfileFavouriteFilmsModel] = [
            .init(title: "1", image: filmImage),
            .init(title: "2", image: filmImage),
            .init(title: "3", image: filmImage),
            .init(title: "4", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage),
            .init(title: "5", image: filmImage)
        ]
        
        let name = UserDefaults.standard.object(forKey: "nameKey") as? String ?? "Дон Григорий"
        let email = UserDefaults.standard.object(forKey: "emailKey") as? String ?? "dongrigory29@gmail.com"
        
        let avatarImage = UIImage(systemName: "person.crop.circle") ?? UIImage(named: "avatar")!
        
        let profileModel: ProfileHeaderModel = .init(userName: name, email: email, avatar: avatarImage)
        
        view?.configureProfile(with: .init(profile: profileModel, favouriteFilms: filmsModel))
    }
}
