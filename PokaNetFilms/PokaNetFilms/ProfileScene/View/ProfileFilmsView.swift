//
//  ProfileFilmsView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 19.11.2023.
//

import Foundation
import UIKit

final class ProfileFilmsView: UIView {
    
    var favLabel = UILabel()
    var moreButton = UIButton()
    var filmsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .white
        setupFavouritesLabel()
        setupMoreButton()
        setupFilmsCollectionView()
    }
}

//MARK: - SetupUI
extension ProfileFilmsView {
    
    func setupFavouritesLabel() {
        addSubview(favLabel)
        
        favLabel.text = "Избранные фильмы"
        favLabel.font = UIFont.systemFont(ofSize: 22)
        favLabel.textColor = .systemBlue
        
        makeConstraintsfavLabel()
    }
    
    func makeConstraintsfavLabel() {
        favLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            favLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }
    
    func setupMoreButton() {
        addSubview(moreButton)
        
        moreButton.setTitle("Смотреть все", for: .normal)
        moreButton.setTitleColor(.systemBlue, for: .normal)
        moreButton.backgroundColor = .clear
        
        makeConstraintsMoreButton()
    }
    
    func makeConstraintsMoreButton() {
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -55),
            moreButton.leftAnchor.constraint(equalTo: leftAnchor),
            moreButton.rightAnchor.constraint(equalTo: rightAnchor),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupFilmsCollectionView() {
        filmsCollectionView.register(FavouriteFilmCell.self, forCellWithReuseIdentifier: "cell")
        
        filmsCollectionView.dataSource = self
        filmsCollectionView.delegate = self
        
        filmsCollectionView.backgroundColor = .clear
        
        addSubview(filmsCollectionView)
        
        makeConstraintsFilmsCV()
    }
    
    func makeConstraintsFilmsCV() {
        filmsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmsCollectionView.topAnchor.constraint(equalTo: favLabel.bottomAnchor),
            filmsCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            filmsCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            filmsCollectionView.bottomAnchor.constraint(equalTo: moreButton.topAnchor)
        ])
    }
}

//MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileFilmsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavouriteFilmCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 60) / 3
        return CGSize(width: cellWidth, height: cellWidth * 1.36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 80
    }
    
}
