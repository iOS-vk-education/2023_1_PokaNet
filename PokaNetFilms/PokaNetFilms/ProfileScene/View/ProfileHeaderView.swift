//
//  ProfileHeaderView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 18.11.2023.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    var settingsButton = UIButton()
    var userNameLabel = UILabel()
    var emailLabel = UILabel()
    var avatar = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProfileHeaderView()
    }
    
    func setupProfileHeaderView() {
        backgroundColor = .white
        setupSettingsButton()
        setupEmailLabel()
        setupUserNameLabel()
        setupAvatar()
    }
    
    func setupSettingsButton(){
        addSubview(settingsButton)
        
        if let symbolImage = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 23)) {
            settingsButton.setImage(symbolImage, for: .normal)
            settingsButton.tintColor = .systemBlue  // Установка цвета символа
        }
        
        settingsButton.setTitle(" Редактировать", for: .normal)
        settingsButton.setTitleColor(.systemBlue, for: .normal)
        settingsButton.backgroundColor = .clear
        
        makeConstraintsSettingsButton()
    }
    
    func makeConstraintsSettingsButton() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -55),
            settingsButton.leftAnchor.constraint(equalTo: leftAnchor),
            settingsButton.rightAnchor.constraint(equalTo: rightAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupEmailLabel() {
        addSubview(emailLabel)
        
        emailLabel.textAlignment = .center
        emailLabel.textColor = .systemGray
        
        makeContraintsEmailLabel()
    }
    
    func makeContraintsEmailLabel() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.leftAnchor.constraint(equalTo: leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: rightAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: settingsButton.topAnchor, constant: -10)
        ])
    }
    
    func setupUserNameLabel() {
        addSubview(userNameLabel)
        
        userNameLabel.textAlignment = .center
        userNameLabel.font = UIFont.systemFont(ofSize: 26)
        
        makeContraintsUserNameLabel()
    }
    
    func makeContraintsUserNameLabel() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            userNameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -5)
        ])
    }
    
    func setupAvatar() {
        
        avatar.frame = CGRectMake(0, 0, 105, 105)
        
        addSubview(avatar)
        
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
        makeConstraintsAvatar()
    }
    
    func makeConstraintsAvatar() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leftAnchor.constraint(equalTo: centerXAnchor, constant: -(avatar.bounds.height) / 2),
            avatar.rightAnchor.constraint(equalTo: centerXAnchor, constant: avatar.bounds.height / 2),
            avatar.bottomAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: -16)
        ])
    }
    
}
