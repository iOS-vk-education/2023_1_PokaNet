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

extension TabBarController {
    
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
        let mainVC = MainAssembly.assembly()
        let favVC = FavAssembly.assembly()
        
        searchVC.tabBarItem.title = "Поиск"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        
        mainVC.tabBarItem.title = "Главная"
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        
        favVC.tabBarItem.title = "Избранное"
        favVC.tabBarItem.image = UIImage(systemName: "heart.fill")
        
        viewControllers = [searchVC, mainVC, profileVC, favVC]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.image == UIImage(systemName: "magnifyingglass") {
            print("[DEBUG] searchScene")
            var tapsOnSearchScene = UserDefaults.standard.integer(forKey: "tapsOnSearchScene")
            tapsOnSearchScene += 1
            print("[DEBUG] searchScene \(tapsOnSearchScene)")
            UserDefaults.standard.set(tapsOnSearchScene, forKey: "tapsOnSearchScene")
        }
    }
}
