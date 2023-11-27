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
        setupIcon()
        setupLabel()
    }
    
    func setupIcon() {
        self.addSubview(iconView)
        iconView.clipsToBounds = true
        iconView.contentMode = .scaleAspectFill
        iconView.frame = CGRect(x: 16, y: 14, width: 30, height: 30)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false // для активации верстки кодом
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconView.widthAnchor.constraint(equalToConstant: 25),
            iconView.heightAnchor.constraint(equalToConstant: 25),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupLabel() {
        self.addSubview(textLabel)
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.textAlignment = .center
        textLabel.textColor = .gray
        textLabel.translatesAutoresizingMaskIntoConstraints = false // для активации верстки кодом
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
