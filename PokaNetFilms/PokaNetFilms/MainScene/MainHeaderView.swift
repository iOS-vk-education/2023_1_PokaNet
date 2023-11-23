//
//  MainHeaderView.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 22.11.23..
//

import Foundation
import UIKit

class MainHeaderView: UICollectionReusableView {
    
    var headerLabel = UILabel()
    static let identifier = "Header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainHeaderView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainHeaderView()
    }
    
    public func setupMainHeaderView() {
        
        backgroundColor = .white
        setupHeaderLabel()
    }
    
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
        
        headerLabel.text = "Сегодня в кино"
        headerLabel.font = UIFont(name: "Helvetica Neue", size: 30)
        headerLabel.textAlignment = .left
        headerLabel.textColor = UIColor(red: 0.00, green: 0.47, blue: 1.00, alpha: 1.00)
        
        makeContraintsHeaderLabel()
    }
    
    func makeContraintsHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            headerLabel.rightAnchor.constraint(equalTo: rightAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

