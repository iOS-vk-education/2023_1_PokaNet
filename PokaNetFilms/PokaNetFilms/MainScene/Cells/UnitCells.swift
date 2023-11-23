//
//  UnitCells.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 20.11.23..
//

import UIKit

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
        backgroundColor = UIColor(red: 0.79, green: 0.75, blue: 0.52, alpha: 1.00)
    }
    
    func setupFilmNameLabel() {
        addSubview(filmNameLabel)
        filmNameLabel.text = "Дурные деньги"
        actorsLabel.numberOfLines = 0
        actorsLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        actorsLabel.textAlignment = .left
        filmNameLabel.font = UIFont(name: "Helvetica Neue", size: 17)
        filmNameLabel.textColor = .white
        
        makeConstraintsFilmNameLabel()
    }
    
    func makeConstraintsFilmNameLabel() {
        filmNameLabel.preferredMaxLayoutWidth = 130 // максимальная ширина текста
        filmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            // textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filmNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            //textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupActorsLabel() {
        addSubview(actorsLabel)
        actorsLabel.text = "Пол Дано, Пит Девидсон, Америка Ферерра, Себастиан Стэн"
        actorsLabel.numberOfLines = 0
        actorsLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        actorsLabel.textAlignment = .left
        actorsLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        actorsLabel.textColor = .white
        
        makeConstraintsActorsLabel()
    }
    
    func makeConstraintsActorsLabel() {
        actorsLabel.preferredMaxLayoutWidth = 130 // максимальная ширина текста
        actorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actorsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            // textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            actorsLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 10),
            //textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupAgeLabel() {
        addSubview(ageLabel)
        ageLabel.text = "18+"
        ageLabel.textAlignment = .left
        ageLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        ageLabel.textColor = .white
        
        makeConstraintsAgeLabel()
    }
    
    func makeConstraintsAgeLabel() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            // textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //actorsLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 10),
            ageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
        ])
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.text = "В кино с 20 ноября"
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 10)
        dateLabel.textColor = .white
        
        makeConstraintsDateLabel()
    }
    
    func makeConstraintsDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 5),
            // textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //actorsLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func setupGenreLabel() {
        addSubview(genreLabel)
        genreLabel.text = "биография, комедия, история"
        genreLabel.numberOfLines = 0
        genreLabel.lineBreakMode = .byWordWrapping // перенос текста по словам
        genreLabel.textAlignment = .left
        genreLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        genreLabel.textColor = .white
        
        makeConstraintsGenreLabel()
    }
    
    func makeConstraintsGenreLabel() {
        genreLabel.preferredMaxLayoutWidth = 130 // максимальная ширина текста
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            // textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            //actorsLabel.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 10),
            genreLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -10)
        ])
    }
    
    func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.text = "от 200 ₽"
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont(name: "Helvetica Neue", size: 8)
        priceLabel.textColor = .white
        priceLabel.backgroundColor = .black
        priceLabel.alpha = 0.7 // делаем Лейбл полупрозрачным
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
        filmImage.image = UIImage(named: "moneyImage")
        makeConstraitsFilmImage()
    }
    
    
    func makeConstraitsFilmImage() {
        filmImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            filmImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            filmImage.topAnchor.constraint(equalTo: topAnchor),
            filmImage.centerYAnchor.constraint(equalTo: centerYAnchor),
           // filmImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
