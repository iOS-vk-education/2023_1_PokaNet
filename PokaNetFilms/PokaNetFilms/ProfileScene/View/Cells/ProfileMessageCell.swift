//
//  ProfileMessageCell.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 24.11.2023.
//

import UIKit

class ProfileMessageCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with message: String) {
        messageLabel.text = message
    }
}
