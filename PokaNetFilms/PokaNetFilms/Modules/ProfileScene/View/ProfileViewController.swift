//
//  ProfileViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 17.11.2023.
//

import Foundation
import UIKit

enum Section: Int {
    case profile = 0
    case favouriteFilms = 1
}

final class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - Properties
    private let output: ProfileViewOutput
    private var profileModel = ProfileHeaderModel(userName: "", email: "")
    private var favouriteFilms: [ProfileFavouriteFilmsModel] = []
    
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
        profileCollectionView.register(ReusableCell.self, forCellWithReuseIdentifier: "ProfileFavouriteFilmCell")
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
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            assertionFailure("Unexpected section")
            return UICollectionViewCell()
        }
        
        switch section {
        case .profile:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeaderCell", for: indexPath) as? ProfileHeaderCell else {
                assertionFailure("The dequeued cell is not an instance of ProfileHeaderCell.")
                return UICollectionViewCell()
            }
            cell.delegate = self
            cell.configure(profileModel)
            return cell
        case .favouriteFilms:
            if favouriteFilms.isEmpty {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileMessageCell", for: indexPath) as? ProfileMessageCell else {
                    assertionFailure("The dequeued cell is not an instance of ProfileMessageCell.")
                    return UICollectionViewCell()
                }
                cell.configure(with: "У пользователя пока что нет избранных фильмов")
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileFavouriteFilmCell", for: indexPath) as? ReusableCell else {
                    assertionFailure("The dequeued cell is not an instance of ProfileFavouriteFilmCell.")
                    return UICollectionViewCell()
                }
//                cell.configure(favouriteFilms[indexPath.row])
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderView", for: indexPath) as? ProfileHeaderView {
                headerView.configure(with: "")
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
            return CGSize(width: collectionView.frame.width, height: collectionView.bounds.height / 1.5)
        } else {
            let paddingSpace = 16 * 2
            let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
            return CGSize(width: availableWidth, height: 160)
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
        self.profileModel = model.profile
        self.favouriteFilms = model.favouriteFilms
    }
}

