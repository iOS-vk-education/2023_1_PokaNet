//
//  UnitCells.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 20.11.23..
//

import UIKit

final class MainCell: UICollectionViewCell { // ячейка для коллекции
    let textLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MainUnitModel) {
    }
}

private extension MainCell {
    func setup() {
        setupLabel()
        layer.cornerRadius = 20
        backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupLabel() {
        addSubview(textLabel)
        textLabel.text = "aboba"
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 30)
        textLabel.textColor = .black
    }
}

