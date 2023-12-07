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
        let searchVC = SearchAssembly.assembly()
        let profileVC = ProfileAssembly.assembly()
        let filmVC = FilmAssembly.assembly()
        filmVC.tabBarItem.title = "Деталка"
        searchVC.tabBarItem.title = "Поиск"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        
        viewControllers = [searchVC, profileVC, filmVC]
    }
}
