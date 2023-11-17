//
//  ProfileViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    
    private let output: ProfileViewOutput
    private var models: [ProfileUnitModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didLoadView()
        view.backgroundColor = .systemGray
        print(models.count)
    }
    
    init(output: ProfileViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController: ProfileViewInput {
    func configure(with model: ProfileViewModel) {
        print(1)
        self.models = model.units
        print(#function)
        print(model)
    }
}
