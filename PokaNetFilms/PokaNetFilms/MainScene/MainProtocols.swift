//
//  MainProtocols.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation

protocol MainModuleInput {
    var moduleOutput: MainModuleOutput? { get }
}

protocol MainModuleOutput: AnyObject {
}

protocol MainViewInput: AnyObject {
    func configure(with models: MainViewModel)
}

protocol MainViewOutput: AnyObject {
    func didLoadView()
}

