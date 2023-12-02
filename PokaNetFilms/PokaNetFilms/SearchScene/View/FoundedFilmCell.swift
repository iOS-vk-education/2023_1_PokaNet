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
        // Create a mask layer and the frame to determine the future shape
        let maskLayer = CAShapeLayer()
        maskLayer.frame = imageView.bounds
        
        // Create a path with the rectangle in it, with the same bounds as the image
        let path = UIBezierPath(roundedRect: imageView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 30, height: 30))
        
        // Set the newly created shape as the mask for the imageView's layer
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
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupTitle() {
        addSubview(titleLabel)
        titleLabel.text = "Filmname"
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
