//
//  SearchAssembly.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation
import UIKit

final class SearchAssembly {
    static func assembly(moduleOutput: SearchModuleOutput? = nil) -> UIViewController{
        let presenter = SearchPresenter()
        let viewController = SearchViewController(output: presenter)
        let router = SearchRouter(sourceView: viewController)
        
        presenter.router = router
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return viewController
    }
}
