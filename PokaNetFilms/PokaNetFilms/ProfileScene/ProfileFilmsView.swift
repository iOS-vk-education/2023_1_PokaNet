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
    }
    
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
}
