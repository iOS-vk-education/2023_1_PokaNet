//
//  ProfileViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    private let output: ProfileViewOutput
    private var model: ProfileViewModel!
    
    private let profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didLoadView()
        setupUI()
    }
    
    // MARK: - Initializers
    init(output: ProfileViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: 0)
        }
    }
}

//MARK: - setupUI
private extension ProfileViewController {
    func setupUI() {
        view.backgroundColor = .white
        setupProfileCollectionView()
    }
    
    func setupProfileCollectionView() {
        view.addSubview(profileCollectionView)
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: "ProfileHeaderCell")
        profileCollectionView.register(ProfileFavouriteFilmCell.self, forCellWithReuseIdentifier: "ProfileFavouriteFilmCell")
        profileCollectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView")
        profileCollectionView.register(ProfileMessageCell.self, forCellWithReuseIdentifier: "ProfileMessageCell")
        
        profileCollectionView.backgroundColor = .systemGray4
        
        profileCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UICollectionViewDelegate {}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return model.favoriteFilms.isEmpty ? 1 : model.favoriteFilms.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeaderCell", for: indexPath) as! ProfileHeaderCell
            cell.configure(model.profile)
            return cell
        } else {
            if model.favoriteFilms.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileMessageCell", for: indexPath) as! ProfileMessageCell
                cell.configure(with: "У пользователя пока что нет избранных фильмов")
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileFavouriteFilmCell", for: indexPath) as! ProfileFavouriteFilmCell
                cell.configure(model.favoriteFilms, indexPath)
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as? ProfileHeaderView {
                headerView.configure(with: "Избранные фильмы")
                return headerView
            } else {
                return UICollectionReusableView()
            }
        } else {
            return UICollectionReusableView()
        }
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            CGSize(width: collectionView.frame.width, height: collectionView.bounds.height / 3)
        } else {
            CGSize(width: (collectionView.bounds.width) / 3 - 24, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.frame.width - 32, height: 60)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1 {
            return 16
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 1 {
            return 16
        } else {
            return 0
        }
    }
}

//MARK: - ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func configureProfile(with model: ProfileViewModel) {
        self.model = model
    }
}
