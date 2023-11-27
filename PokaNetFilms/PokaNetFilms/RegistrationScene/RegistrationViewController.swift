//
//  RegistrationViewController.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation
import UIKit

final class RegistrationViewController: UIViewController {
    
    private let output: RegistrationViewOutput
    
    init(output: RegistrationViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegistrationViewController: RegistrationViewInput {
    
}
