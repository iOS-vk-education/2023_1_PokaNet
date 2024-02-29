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
    private var imageView = UIImageView()
    private var title = UILabel()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
private extension ProfileFavouriteFilmCell {
    func setupUI() {
        
        layer.cornerRadius = 10
        backgroundColor = .white
        
        setupImage()
        setupTitle()
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
//        let filmHeight: CGFloat = frame.height / 3
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: filmHeight)
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
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3),
            title.leftAnchor.constraint(equalTo: leftAnchor),
            title.rightAnchor.constraint(equalTo: rightAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3)
        ])
    }
    
}

//MARK: - Configure model
extension ProfileFavouriteFilmCell {
    func configure(_ favoriteFilms: ProfileFavouriteFilmsModel) {
        title.text = favoriteFilms.title
        imageView.image = favoriteFilms.image
    }
}
