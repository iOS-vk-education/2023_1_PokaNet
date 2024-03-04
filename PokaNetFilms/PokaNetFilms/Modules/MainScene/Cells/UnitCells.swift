//
//  UnitCells.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 20.11.23..
//

import UIKit
import Kingfisher
final class MainMovieCell: UICollectionViewCell {
    
    let filmNameLabel = UILabel()
    let actorsLabel = UILabel()
    let ageLabel = UILabel()
    let dateLabel = UILabel()
    let genreLabel = UILabel()
    let priceLabel = UILabel()
    let filmImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MainMovieCellModel) {
        filmNameLabel.text = model.filmNameLabel
        actorsLabel.text = model.actorsLabel
        ageLabel.text = model.ageLabel
        dateLabel.text = model.dateLabel
        genreLabel.text = model.genreLabel
        priceLabel.text  = model.priceLabel
        backgroundColor = model.backgroundColor
        
        if let url = URL(string: model.filmImage) {
            filmImage.kf.setImage(with: url)
        } else {
            print("Неверный URL изображения")
        }
    }
}

private extension MainMovieCell {
    func setup() {
        setupFilmImage()
        setupFilmNameLabel()
        setupActorsLabel()
        setupAgeLabel()
        setupDateLabel()
        setupGenreLabel()
        setupPriceLabel()
        layer.cornerRadius = 25
        layer.masksToBounds = true // картинка не вылезает за пределы ячейки
    }
    
    func setupFilmNameLabel() {
        addSubview(filmNameLabel)
        filmNameLabel.numberOfLines = 0
        filmNameLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        filmNameLabel.textAlignment = .left
        filmNameLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        filmNameLabel.textColor = .white
        
        makeConstraintsFilmNameLabel()
    }
    
    func makeConstraintsFilmNameLabel() {
        filmNameLabel.preferredMaxLayoutWidth = 120 // максимальная ширина текста
        filmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            filmNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        ])
    }
    
    func setupActorsLabel() {
        addSubview(actorsLabel)
        actorsLabel.numberOfLines = 0
        actorsLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        actorsLabel.textAlignment = .left
        actorsLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        actorsLabel.textColor = .white
        
        makeConstraintsActorsLabel()
    }
    
    func makeConstraintsActorsLabel() {
        actorsLabel.preferredMaxLayoutWidth = 120 // максимальная ширина текста
        actorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actorsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            actorsLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setupAgeLabel() {
        addSubview(ageLabel)
        ageLabel.textAlignment = .left
        ageLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        ageLabel.textColor = .white
        
        makeConstraintsAgeLabel()
    }
    
    func makeConstraintsAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 10)
        dateLabel.textColor = .white
        
        makeConstraintsDateLabel()
    }
    
    func makeConstraintsDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func setupGenreLabel() {
        addSubview(genreLabel)
        genreLabel.numberOfLines = 0
        genreLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        genreLabel.textAlignment = .left
        genreLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        genreLabel.textColor = .white
        
        makeConstraintsGenreLabel()
    }
    
    func makeConstraintsGenreLabel() {
        genreLabel.preferredMaxLayoutWidth = 120        // максимальная ширина текста
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            genreLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10)
        ])
    }
    
    func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        priceLabel.textColor = .white
        priceLabel.backgroundColor = .black
        priceLabel.alpha = 0.7                      // делаем Лейбл полупрозрачным
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerRadius = 7
        
        makeConstraintsPriceLabel()
    }
    
    func makeConstraintsPriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            priceLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: -31),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func setupFilmImage() {
        addSubview(filmImage)
        
        filmImage.clipsToBounds = true
        filmImage.contentMode = .scaleAspectFill
        makeConstraitsFilmImage()
    }
    
    
    func makeConstraitsFilmImage() {
        filmImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            filmImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            filmImage.topAnchor.constraint(equalTo: topAnchor),
            filmImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
