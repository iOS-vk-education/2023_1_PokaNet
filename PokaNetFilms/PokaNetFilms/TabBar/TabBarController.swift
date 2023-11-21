//
//  TabBarController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

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

        let mainVC = MainAssembly.assembly()

        mainVC.tabBarItem.title = "Профиль"
        mainVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")

        viewControllers = [mainVC]
    }
}

