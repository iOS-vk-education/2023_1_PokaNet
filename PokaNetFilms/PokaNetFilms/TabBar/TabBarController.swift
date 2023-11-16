//
//  ViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 02.11.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setupTabBar()
    }
}

extension TabBarController {
    func generateTabBar() {
        viewControllers = []
    }
    
    func generateVC(viewController: UIViewController, title: String) -> UIViewController {
        viewController.tabBarItem.title = title
        
        return viewController
    }
    
    func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
}
