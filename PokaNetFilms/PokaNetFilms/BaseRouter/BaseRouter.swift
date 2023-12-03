//
//  BaseRouter.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 03.12.2023.
//

import UIKit

class BaseRouter: BaseRouterInput {
    
    weak var sourceView: UIViewController?
    
    init(sourceView: UIViewController? = nil) {
        self.sourceView = sourceView
    }
    
    func presentFromSourceView(viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        sourceView?.present(viewController, animated: true)
    }
    
    func dismiss(completion: @escaping () -> Void) {
        sourceView?.dismiss(animated: true, completion: completion)
    }
}
