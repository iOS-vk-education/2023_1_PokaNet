//
//  AuthorizationImageButton.swift
//  PokaNetFilms
//
//  Created by Ma Millerr on 26.11.2023.
//

import Foundation
import UIKit

final class AuthorizationImageButton: UIButton {
    private let iconView = UIImageView()
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(icon iconName: String, title: String?) {
        iconView.image = UIImage(named: iconName)
        textLabel.text = title
    }
}

private extension AuthorizationImageButton {
    func setup() {
        setupLayout()
        setupAppearance()
    }
    
    func setupLayout() {
        
        //контейнерами прибиваешь слева картинку а по центру лейбл
    }
    
    func setupAppearance() {
        
    }
}
