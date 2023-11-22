//
//  FilmPresenter.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit


final class FilmPresenter {
    weak var view : FilmViewInput?
    weak var moduleOutput: FilmModuleOutput?
    
}

extension FilmPresenter: FilmModuleOutput{}

extension FilmPresenter: FilmViewOutput{
    func didLoadView() {
        print(#function)
    }
}
