//
//  SearchProtocols.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation
import UIKit

protocol SearchModuleInput {
    var moduleOutput: SearchModuleOutput? { get }
}

protocol SearchModuleOutput: AnyObject {
}

protocol SearchViewInput: AnyObject {
    func configureSearch(with model: [SearchFilmsModel])
}

protocol SearchViewOutput: AnyObject {
    func didLoadView()
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    func didChangeSearchText(_ searchText: String)
}
