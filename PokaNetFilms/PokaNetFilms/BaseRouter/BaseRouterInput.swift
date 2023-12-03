//
//  BaseRouterInput.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 03.12.2023.
//

import UIKit

protocol BaseRouterInput: AnyObject {
    func presentFromSourceView(viewController: UIViewController)
    func dismiss(completion: @escaping () -> Void)
}
