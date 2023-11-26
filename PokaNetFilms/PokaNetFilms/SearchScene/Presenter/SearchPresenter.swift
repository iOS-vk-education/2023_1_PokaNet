//
//  SearchPresenter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation
import UIKit

final class SearchPresenter {

    weak var view: SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?

}

extension SearchPresenter: SearchModuleInput {}

extension SearchPresenter: SearchViewOutput {
    func didLoadView() {
    }
}

private extension SearchPresenter {
}
