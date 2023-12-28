//
//  AlertManager.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 27.12.2023.
//

import UIKit

class AlertManager {
    
    static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
}
