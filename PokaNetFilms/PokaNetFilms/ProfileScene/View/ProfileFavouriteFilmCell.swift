//
//  FavouriteFilmCell.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

import Foundation
import UIKit

final class ProfileFavouriteFilmCell: UICollectionViewCell {
    
    // MARK: - Properties
    var imageView = UIImageView()
    var title = UILabel()
    
    var model: ProfileViewModel?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
extension ProfileFavouriteFilmCell {
    func setupUI() {
        
        layer.cornerRadius = 10
        backgroundColor = .white
        
        setupTitle()
        setupImage()
    }
    
    func setupImage() {
        addSubview(imageView)
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        makeConstraintsImageView()
    }
    
    func makeConstraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -3)
        ])
    }
    
    func setupTitle() {
        addSubview(title)
        
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .black
        title.textAlignment = .center
        
        makeConstraintsTitle()
    }
    
    func makeConstraintsTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 20),
            title.leftAnchor.constraint(equalTo: leftAnchor),
            title.rightAnchor.constraint(equalTo: rightAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
   
}

//MARK: - Configure model
extension ProfileFavouriteFilmCell {
    func configure(with model: ProfileViewModel, by indexPath: IndexPath) {
        if indexPath.section == 1 {
            title.text = model.favoriteFilms[indexPath.item].title
            imageView.image = model.favoriteFilms[indexPath.item].image
        }
    }
}
