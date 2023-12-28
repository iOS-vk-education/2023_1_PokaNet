//
//  SceneDelegate.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 02.11.2023.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let authVC = AuthorizationAssembly.assembly()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}



//import UIKit
//import FirebaseAuth
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    
//    var window: UIWindow?
//    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        self.setupWindow(with: scene)
//        self.checkAuthentication()
//    }
//        
//    
//    private func setupWindow(with scene: UIScene) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: windowScene)
//        self.window = window
//        self.window?.makeKeyAndVisible()
//    }
//    
//    public func checkAuthentication() {
//        if Auth.auth().currentUser == nil {
//            self.goToController(with: RegistrationViewController())
//        } else {
//            self.goToController(with: MainViewController())
//        }
//    }
//        
//    private func goToController(with viewController: UIViewController) {
//        DispatchQueue.main.async { [weak self] in
//            UIView.animate(withDuration: 0.25) {
//                self?.window?.layer.opacity = 0
//                
//            } completion: { [weak self] _ in
//                
//                let nav = UINavigationController(rootViewController: viewController)
//                nav.modalPresentationStyle = .fullScreen
//                self?.window?.rootViewController = nav
//                
//                UIView.animate(withDuration: 0.25) { [weak self] in
//                    self?.window?.layer.opacity = 1
//                }
//            }
//        }
//    }
    
//    func sceneDidDisconnect(_ scene: UIScene) {
//    }
//    
//    func sceneDidBecomeActive(_ scene: UIScene) {
//    }
//    
//    func sceneWillResignActive(_ scene: UIScene) {
//    }
//    
//    func sceneWillEnterForeground(_ scene: UIScene) {
//    }
//    
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
//    }
//    
//}
