//
//  FilmProtocols.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation


protocol FilmModuleInput {
    var moduleOutput: FilmModuleOutput? { get }
}

protocol FilmModuleOutput: AnyObject {
}

protocol FilmViewInput: AnyObject {
//    func configureAuthorization(with model: AuthorizationViewModel?)
}

protocol FilmViewOutput: AnyObject {
    func didLoadView()
}
