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
    private var model: ProfileUnitModel! // я не уверен, что так можно, но мне кажется что так лучше
    
    //MARK: - UI elements
    private let settingsButton = UIButton()
    private let viewLayer = UIView()
    private let userNameLabel = UILabel()
    private let emailLabel = UILabel()
    private let avatar = UIImageView()
    private let filmsLayer = UIView()
    private let favLabel = UILabel()
    private let moreButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didLoadView()
        view.backgroundColor = .systemGray4
        
        setupUI()
    }
    
    init(output: ProfileViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Settings for UI
private extension ProfileViewController {
    func setupUI() {
        setupViewLayer()
        setupSettingsButton()
        setupEmailLabel()
        setupUserNameLabel()
        setupAvatar()
        setupFilmsLayer()
        setupFavouritesLabel()
        setupMoreButton()
    }
    
    func setupViewLayer() {
        view.addSubview(viewLayer)
        
        viewLayer.layer.cornerRadius = 25
        viewLayer.backgroundColor = .white
        
        makeConstraintsViewLayer()
    }
    
    func makeConstraintsViewLayer() {
        viewLayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewLayer.topAnchor.constraint(equalTo: view.topAnchor),
            viewLayer.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            viewLayer.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            viewLayer.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
        ])
    }
    
    func setupSettingsButton() {
        viewLayer.addSubview(settingsButton)
        
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
            settingsButton.topAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: -55),
            settingsButton.leftAnchor.constraint(equalTo: viewLayer.leftAnchor),
            settingsButton.rightAnchor.constraint(equalTo: viewLayer.rightAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: viewLayer.bottomAnchor)
        ])
    }
    
    func setupEmailLabel() {
        viewLayer.addSubview(emailLabel)
        
        emailLabel.textAlignment = .center
        emailLabel.textColor = .systemGray
        emailLabel.text = model.email
        
        makeContraintsEmailLabel()
    }
    
    func makeContraintsEmailLabel() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
            emailLabel.leftAnchor.constraint(equalTo: viewLayer.leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: viewLayer.rightAnchor),
            emailLabel.bottomAnchor.constraint(equalTo: settingsButton.topAnchor, constant: -10)
        ])
    }
    
    func setupUserNameLabel() {
        viewLayer.addSubview(userNameLabel)
        
        userNameLabel.textAlignment = .center
        userNameLabel.font = UIFont.systemFont(ofSize: 26)
        userNameLabel.text = "@\(model.userName)"
        
        makeContraintsUserNameLabel()
    }
    
    func makeContraintsUserNameLabel() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameLabel.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
            userNameLabel.leftAnchor.constraint(equalTo: viewLayer.leftAnchor),
            userNameLabel.rightAnchor.constraint(equalTo: viewLayer.rightAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -5)
        ])
    }
    
    func setupAvatar() {
        
        avatar.frame = CGRectMake(0, 0, 135, 135)
        
        viewLayer.addSubview(avatar)
        
        avatar.image = UIImage(named: "avatar")
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
        makeConstraintsAvatar()
    }
    
    func makeConstraintsAvatar() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.centerXAnchor.constraint(equalTo: viewLayer.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leftAnchor.constraint(equalTo: viewLayer.centerXAnchor, constant: -(avatar.bounds.height) / 2),
            avatar.rightAnchor.constraint(equalTo: viewLayer.centerXAnchor, constant: avatar.bounds.height / 2),
            avatar.bottomAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: -16)
        ])
    }
    
    func setupFilmsLayer() {
        view.addSubview(filmsLayer)
        
        filmsLayer.layer.cornerRadius = 25
        filmsLayer.backgroundColor = .white
        
        makeConstraintsFilmsLayer()
    }
    
    func makeConstraintsFilmsLayer() {
        filmsLayer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmsLayer.topAnchor.constraint(equalTo: viewLayer.bottomAnchor, constant: 16),
            filmsLayer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            filmsLayer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            filmsLayer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func setupFavouritesLabel() {
        filmsLayer.addSubview(favLabel)
        
        favLabel.text = "Избранные фильмы"
        favLabel.font = UIFont.systemFont(ofSize: 22)
        favLabel.textColor = .systemBlue
        
        makeConstraintsfavLabel()
    }
    
    func makeConstraintsfavLabel() {
        favLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favLabel.topAnchor.constraint(equalTo: filmsLayer.topAnchor, constant: 20),
            favLabel.leftAnchor.constraint(equalTo: filmsLayer.leftAnchor, constant: 20)
        ])
    }
    
    func setupMoreButton() {
        filmsLayer.addSubview(moreButton)
        
        moreButton.setTitle(" Смотреть все", for: .normal)
        moreButton.setTitleColor(.systemBlue, for: .normal)
        moreButton.backgroundColor = .clear
        
        makeConstraintsMoreButton()
    }
    
    func makeConstraintsMoreButton() {
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: filmsLayer.bottomAnchor, constant: -55),
            moreButton.leftAnchor.constraint(equalTo: filmsLayer.leftAnchor),
            moreButton.rightAnchor.constraint(equalTo: filmsLayer.rightAnchor),
            moreButton.bottomAnchor.constraint(equalTo: filmsLayer.bottomAnchor)
        ])
    }
}

//MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func configure(with model: ProfileViewModel) {
        self.model = model.units
    }
}
