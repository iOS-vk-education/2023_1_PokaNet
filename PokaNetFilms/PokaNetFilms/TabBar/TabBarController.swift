//
//  TabBarController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupTabs()
    }
}

private extension TabBarController {

    func generateVC(viewController: UIViewController, title: String) -> UIViewController {
        viewController.tabBarItem.title = title

        return viewController
    }

    func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
    }

    func setupTabs() {
    }
}

