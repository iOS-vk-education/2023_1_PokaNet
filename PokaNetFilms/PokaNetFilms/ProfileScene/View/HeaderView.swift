//
//  HeaderView.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 22.11.2023.
//

import UIKit

class HeaderView: UICollectionReusableView {

    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        label.layer.shadowOpacity = 0.25
        label.layer.shadowRadius = 4.0
        label.layer.masksToBounds = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup
    private func setupView() {
        backgroundColor = .clear
        addSubview(titleLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Public Methods
    func configure(with title: String) {
        titleLabel.text = title
    }
}
