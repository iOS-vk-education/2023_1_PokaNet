//
//  ProfileHeaderView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 18.11.2023.
//

import Foundation
import UIKit

final class ProfileHeaderCell: UICollectionViewCell {
    
    private let profileImage = UIImageView()
    private let prfileEmail = UILabel()
    private let profileName = UILabel()
    private let settingsButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
extension ProfileHeaderCell {
    func setupUI() {
        backgroundColor = .white
//        makeCellConstraint()
    }
    
    func makeCellConstraint() {
        if let superview = self.superview {
            translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: superview.topAnchor),
                self.leftAnchor.constraint(equalTo: superview.leftAnchor),
                self.rightAnchor.constraint(equalTo: superview.rightAnchor),
                self.bottomAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
        }
    }
    
    func setupSettingsButton(){
        addSubview(settingsButton)
        
        if let symbolImage = UIImage(systemName: "pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 23)) {
            settingsButton.setImage(symbolImage, for: .normal)
            settingsButton.tintColor = .systemBlue
        }
        
        settingsButton.setTitle(" Редактировать", for: .normal)
        settingsButton.setTitleColor(.systemBlue, for: .normal)
        settingsButton.backgroundColor = .clear
        
        makeConstraintsSettingsButton()
    }
    
    func makeConstraintsSettingsButton() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -55),
            settingsButton.leftAnchor.constraint(equalTo: leftAnchor),
            settingsButton.rightAnchor.constraint(equalTo: rightAnchor),
            settingsButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
