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
    private let viewLayer = ProfileHeaderView()
    private let filmsLayer = ProfileFilmsView()
    
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
        view.addSubview(viewLayer)
        
        viewLayer.layer.cornerRadius = 25
        
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
}

//MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func configure(with model: ProfileViewModel?) {
        if let newModel = model {
            viewLayer.emailLabel.text = newModel.units.email
            viewLayer.avatar.image = UIImage(named: newModel.units.avatar)
            viewLayer.userNameLabel.text = newModel.units.userName
        } else {
            print("!!!")
        }
    }
}
