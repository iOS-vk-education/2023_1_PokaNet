//
//  ViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let squareView = UIView()
        squareView.backgroundColor = .blue
        
        self.view.addSubview(squareView)
        
        squareView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100) 
            make.center.equalTo(self.view)
        }
    }


}

