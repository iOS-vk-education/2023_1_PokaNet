

import UIKit

final class FavMovieCell: UICollectionViewCell {
    
    let filmNameLabel = UILabel()
    let actorsLabel = UILabel()
    let ageLabel = UILabel()
    let dateLabel = UILabel()
    let genreLabel = UILabel()
    let priceLabel = UILabel()
    let filmImage = UIImageView()
    let unlikeButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FavMovieCellModel) {
        filmNameLabel.text = model.filmNameLabel
        priceLabel.text  = model.priceLabel
        filmImage.image = model.filmImage
        backgroundColor = model.backgroundColor
        
    }
}

private extension FavMovieCell {
    func setup() {
        setupFilmImage()
        setupFilmNameLabel()
        setupPriceLabel()
        setupUnlikeButton()
        layer.cornerRadius = 25
        layer.masksToBounds = true // картинка не вылезает за пределы ячейки
    }
    
    func setupUnlikeButton() {
        addSubview(unlikeButton)
        unlikeButton.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        unlikeButton.setTitle("Убрать из избранного", for: .normal)
        unlikeButton.addTarget(self, action: #selector(unlikeFilm), for: .touchUpInside)
        unlikeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        unlikeButton.tintColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        unlikeButton.backgroundColor = .systemPink
        unlikeButton.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            unlikeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -55),
            unlikeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            unlikeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            unlikeButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 133),
        ])
    }
    
    
    @objc func unlikeFilm(_ sender: UIButton) {
        //реализация удаления из Избранного
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
