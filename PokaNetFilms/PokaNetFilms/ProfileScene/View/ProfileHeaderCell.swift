//
//  ProfileHeaderView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 18.11.2023.
//

import Foundation
import UIKit

final class ProfileHeaderCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let profileImage = UIImageView()
    private let profileEmail = UILabel()
    private let profileName = UILabel()
    private let settingsButton = UIButton()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
    }
}

//MARK: - SetupUI
extension ProfileHeaderCell {
    func setupUI() {
        backgroundColor = .white
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: [.bottomLeft, .bottomRight],
                                      cornerRadii: CGSize(width: 50, height: 50)).cgPath
        layer.mask = maskLayer
        
        setupSettingsButton()
        setupProfileEmail()
        setupProfileName()
        setupProfileImage()
    }
    
    func setupSettingsButton(){
        addSubview(settingsButton)
        
        if let symbolImage = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 23)) {
            settingsButton.setImage(symbolImage, for: .normal)
            settingsButton.tintColor = .systemBlue
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
    
    func setupProfileEmail() {
        addSubview(profileEmail)
        
        profileEmail.textAlignment = .center
        profileEmail.textColor = .systemGray2
        
        makeConstraintProfileEmail()
    }
    
    func makeConstraintProfileEmail() {
        profileEmail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileEmail.bottomAnchor.constraint(equalTo: settingsButton.topAnchor),
            profileEmail.leftAnchor.constraint(equalTo: leftAnchor),
            profileEmail.rightAnchor.constraint(equalTo: rightAnchor),
            profileEmail.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProfileName() {
        addSubview(profileName)
        
        profileName.textAlignment = .center
        profileName.textColor = .black
        profileName.font = UIFont.systemFont(ofSize: 30)
        
        makeConstraintProfileName()
    }
    
    func makeConstraintProfileName() {
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileName.bottomAnchor.constraint(equalTo: profileEmail.topAnchor),
            profileName.leftAnchor.constraint(equalTo: leftAnchor),
            profileName.rightAnchor.constraint(equalTo: rightAnchor),
            profileName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProfileImage() {
        addSubview(profileImage)
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.masksToBounds = true
        
        makeConstraintProfileImage()
    }
    
    func makeConstraintProfileImage() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: profileName.topAnchor, constant: -5),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor)
        ])
    }
}

extension ProfileHeaderCell {
    func configure(_ model: ProfileViewModel) {
        profileImage.image = model.profile.avatar
        profileName.text = model.profile.userName
        profileEmail.text = model.profile.email
    }
}
