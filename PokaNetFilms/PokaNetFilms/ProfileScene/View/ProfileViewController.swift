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
    private var model: ProfileViewModel?
    
    //MARK: - UI elements
    private let headerView = ProfileHeaderView()
    private let filmsView = ProfileFilmsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didLoadView()
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
        view.backgroundColor = .systemGray4
        setupViewLayer()
        setupFilmsLayer()
    }
    
    func setupViewLayer() {
        view.addSubview(headerView)
        
        headerView.layer.cornerRadius = 25
        
        makeConstraintsViewLayer()
    }
    
    func makeConstraintsViewLayer() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -110)
        ])
    }
    
    func setupFilmsLayer() {
        view.addSubview(filmsView)
        
        filmsView.layer.cornerRadius = 25
        filmsView.backgroundColor = .white
        
        makeConstraintsFilmsLayer()
    }
    
    func makeConstraintsFilmsLayer() {
        filmsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmsView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            filmsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            filmsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            filmsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

//MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func configureProfile(with model: ProfileViewModel?) {
        if let newModel = model {
            headerView.emailLabel.text = newModel.profile.email
            headerView.avatar.image = newModel.profile.avatar
            headerView.userNameLabel.text = newModel.profile.userName
            
            filmsView.configure(newModel)
        } else {
            print("!!!")
        }
    }
}
