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
        let filmImage = UIImage(named: "avatar") ?? UIImage(named: "defaultImage")!
        let filmsModel: [ProfileFavouriteFilmsModel] = [
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage),
            .init(id: 1, title: "1", image: filmImage)
        ]
        
        let name = UserDefaults.standard.object(forKey: "nameKey") as? String ?? "Дон Григорий"
        let email = UserDefaults.standard.object(forKey: "emailKey") as? String ?? "dongrigory29@gmail.com"
        
        let profileModel: ProfileHeaderModel = .init(userName: name, email: email)
        
        view?.configureProfile(with: .init(profile: profileModel, favouriteFilms: filmsModel))
    }
}
