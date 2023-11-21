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

//MARK: -
extension ProfileViewController {
    func setupUI() {
        setupProfileCollectionView()
    }
    
    func setupProfileCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        let profileCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        view.addSubview(profileCollectionView)
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        profileCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        profileCollectionView.backgroundColor = .red
        
        profileCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            profileCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileFavouriteFilmCell else {
            return UICollectionViewCell()
        }
        
        return cell
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
