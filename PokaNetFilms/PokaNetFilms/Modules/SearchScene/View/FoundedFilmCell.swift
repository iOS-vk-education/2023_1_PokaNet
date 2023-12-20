//
//  FoundedFilmCell.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 27.11.2023.
//

import Foundation
import UIKit

final class FoundedFilmCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    private var infoLabel = UILabel()
    private var genreslabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyMaskToImageView()
    }
    
    func applyMaskToImageView() {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = imageView.bounds
        
        let path = UIBezierPath(roundedRect: imageView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 30, height: 30))
        
        maskLayer.path = path.cgPath
        imageView.layer.mask = maskLayer
    }
}

//MARK: - setupUI
extension FoundedFilmCell {
    func setupUI() {
        layer.cornerRadius = 30
        setupImageView()
        setupTitle()
        setupInfoLabel()
        setupGenreslabel()
    }
    
    func setupImageView() {
        addSubview(imageView)
        imageView.image = UIImage(named: "defaultImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.7/3),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupTitle() {
        addSubview(titleLabel)
        titleLabel.text = "Filmname192309123812"
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupInfoLabel() {
        addSubview(infoLabel)
        infoLabel.text = "2018"
        infoLabel.textColor = .black
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            infoLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            infoLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupGenreslabel() {
        addSubview(genreslabel)
        genreslabel.text = "kmdlm vlkdsmlvm klsm lkskldcm lm l"
        genreslabel.textColor = .black
        genreslabel.numberOfLines = 0
        genreslabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreslabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 8),
            genreslabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            genreslabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            genreslabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}


