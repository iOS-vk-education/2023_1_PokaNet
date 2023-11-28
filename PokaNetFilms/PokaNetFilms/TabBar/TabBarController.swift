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
        
        let profileVC = ProfileAssembly.assembly()
        let mainVC = MainAssembly.assembly()
        let filmVC = FilmAssembly.assembly()
        
        mainVC.tabBarItem.title = "Главный экран"
        mainVC.tabBarItem.image = UIImage(systemName: "gear")
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        filmVC.tabBarItem.title = "Детальный экран"
        filmVC.tabBarItem.image = UIImage(systemName: "gear")
        
        viewControllers = [profileVC, mainVC, filmVC]
    }
}
