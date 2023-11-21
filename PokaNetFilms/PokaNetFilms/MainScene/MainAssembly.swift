//
//  MainAssembly.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation
import UIKit

final class MainAssembly {
    static func assembly(
        moduleOutput: MainModuleOutput? = nil
    ) -> UIViewController {
        let presenter = MainPresenter()
        let viewController = MainViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = moduleOutput

        print(#function)
        return viewController
    }
}
