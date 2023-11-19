//
//  FavouriteFilmCell.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

import Foundation
import UIKit

final class FavouriteFilmCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
extension FavouriteFilmCell {
    func setupUI() {
        
        layer.cornerRadius = 10
        
        setupTitle()
        setupImage()
    }
    
    func setupImage() {
        addSubview(imageView)
        
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "fakeFilm")
        imageView.layer.cornerRadius = 10
        
        
        makeConstraintsImageView()
    }
    
    func makeConstraintsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -5)
        ])
    }
    
    func setupTitle() {
        addSubview(title)
        
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .systemBlue
        title.textAlignment = .center
        title.text = "Film"
        
        makeConstraintsTitle()
    }
    
    func makeConstraintsTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            title.leftAnchor.constraint(equalTo: leftAnchor),
            title.rightAnchor.constraint(equalTo: rightAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
