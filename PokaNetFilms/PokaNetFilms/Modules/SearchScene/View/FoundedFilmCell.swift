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
        backgroundColor = .black
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
