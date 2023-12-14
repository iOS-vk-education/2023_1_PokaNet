//
//  FilmViewController.swift
//  PokaNetFilms
//
//  Created by Mikhail Ulanov on 27.11.2023.
//

import Foundation
import UIKit

final class FilmViewController: UIViewController {
    
    let output: FilmViewOutput
    var model: FilmViewModel?
    
    let scrollView = UIScrollView()
    let ticketsButton = UIButton()
    let containerView = UIView()
    let filmShowLabel = UILabel()
    let kinopoiskLabel = UILabel()
    let filmDescriptionLabel = UILabel()
    let filmAuthorLabel = UILabel()
    let filmCastLabel = UILabel()
    
    let filmImage = UIImageView()
    let filmTitle = UILabel()
    let scoreLabel = UILabel()
    let movieDetailsLabel = UILabel()
    let kinopoiskScoreLabel = UILabel()
    let filmCountryLabel = UILabel()
    let filmYearLabel = UILabel()
    let filmDescriptionTextLabel = UILabel()
    let filmShowDateLabel = UILabel()
    let filmAuthorNameLabel = UILabel()
    let filmCastTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        scrollView.delegate = self
        view.backgroundColor = UIColor.white
        
        setupScrollView()
        setupTicketsButton()
        setupContainerView()
        setupFilmImage()
        setupFilmLabel()
        setupScoreLabel()
        setupKinopoiskLabel()
        setupKinopoiskScoreLabel()
        setupFilmCountryLabel()
        setupFilmYearLabel()
        setupMovieDetailsLabel()
        setupFilmDescriptionLabel()
        setupFilmDescriptionTextLabel()
        setupFilmShowLabel()
        setupFilmShowDateLabel()
        setupFilmAuthorLabel()
        setupFilmAuthorNameLabel()
        setupFilmCastLabel()
        setupFilmCastTextLabel()
    }
    
    init(output: FilmViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("[DEBUG]: FATAL ERROR")
    }
}

extension FilmViewController{
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        // Отключение полоски прокрутки
        scrollView.showsVerticalScrollIndicator = false // Для вертикальной полоски прокрутки
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    
    func setupTicketsButton() {
        view.addSubview(ticketsButton)
        ticketsButton.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        
        ticketsButton.setTitle("Расписание и билеты", for: .normal)
        ticketsButton.tintColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        ticketsButton.backgroundColor = .systemPink
        ticketsButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            ticketsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55),
            ticketsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            ticketsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ticketsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
    
    func setupContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 10)
        ])
    }
    
    
    func setupFilmImage() {
        containerView.addSubview(filmImage)
        filmImage.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmImage.contentMode = .scaleAspectFill
        
        let filmHeight: CGFloat = UIScreen.main.bounds.height / 3.5
        NSLayoutConstraint.activate([
            filmImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            filmImage.heightAnchor.constraint(equalToConstant: filmHeight),
            filmImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            filmImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    

    func setupFilmLabel() {
        containerView.addSubview(filmTitle)
        filmTitle.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmTitle.textAlignment = .center //текст по центру
        filmTitle.textColor = UIColor(red: 0.77, green: 0.00, blue: 0.00, alpha: 1.00)
        filmTitle.font = UIFont.systemFont(ofSize: 40)
        filmTitle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            filmTitle.topAnchor.constraint(equalTo: filmImage.bottomAnchor, constant: 10),
            filmTitle.heightAnchor.constraint(equalToConstant: CGFloat(60)),
            filmTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            filmTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    

    func setupScoreLabel() {
        containerView.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        scoreLabel.textAlignment = .center //текст по центру
        scoreLabel.font = UIFont.systemFont(ofSize: 40)
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: filmTitle.bottomAnchor, constant: 10),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50),
            scoreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            scoreLabel.trailingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 76)
        ])
        
    }
    
    
    func setupKinopoiskLabel() {
        containerView.addSubview(kinopoiskLabel)
        kinopoiskLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        kinopoiskLabel.textAlignment = .center //текст по центру
        kinopoiskLabel.text = "Кинопоиск"
        kinopoiskLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            kinopoiskLabel.topAnchor.constraint(equalTo: filmTitle.bottomAnchor),
            kinopoiskLabel.heightAnchor.constraint(equalToConstant: 40),
            kinopoiskLabel.leadingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: scoreLabel.intrinsicContentSize.width + 10),
            kinopoiskLabel.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: scoreLabel.intrinsicContentSize.width + 150)
        ])
    }
    
  
    func setupKinopoiskScoreLabel() {
        containerView.addSubview(kinopoiskScoreLabel)
        kinopoiskScoreLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        kinopoiskScoreLabel.textAlignment = .center //текст по центру
        kinopoiskScoreLabel.font = UIFont.systemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            kinopoiskScoreLabel.topAnchor.constraint(equalTo: kinopoiskLabel.bottomAnchor),
            kinopoiskScoreLabel.heightAnchor.constraint(equalToConstant: 18),
            kinopoiskScoreLabel.leadingAnchor.constraint(equalTo: kinopoiskLabel.leadingAnchor),
            kinopoiskScoreLabel.trailingAnchor.constraint(equalTo: kinopoiskLabel.trailingAnchor)
        ])
    }
    
    
    func setupFilmCountryLabel() {
        containerView.addSubview(filmCountryLabel)
        filmCountryLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmCountryLabel.font = UIFont.systemFont(ofSize: 20)
        filmCountryLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            filmCountryLabel.topAnchor.constraint(equalTo: filmTitle.bottomAnchor),
            filmCountryLabel.heightAnchor.constraint(equalToConstant: 40),
            filmCountryLabel.leadingAnchor.constraint(equalTo: kinopoiskLabel.trailingAnchor),
            filmCountryLabel.trailingAnchor.constraint(equalTo: kinopoiskLabel.trailingAnchor, constant: 100)
        ])
    }
    
    
    func setupFilmYearLabel() {
        containerView.addSubview(filmYearLabel)
        filmYearLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmYearLabel.font = UIFont.systemFont(ofSize: 16)
        filmYearLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            filmYearLabel.topAnchor.constraint(equalTo: filmCountryLabel.bottomAnchor),
            filmYearLabel.trailingAnchor.constraint(equalTo: filmCountryLabel.trailingAnchor),
            filmYearLabel.leadingAnchor.constraint(equalTo: kinopoiskScoreLabel.trailingAnchor)
        ])
    }
    
    
    func setupMovieDetailsLabel() {
        containerView.addSubview(movieDetailsLabel)
        movieDetailsLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        movieDetailsLabel.font = UIFont.systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            movieDetailsLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10),
            movieDetailsLabel.heightAnchor.constraint(equalToConstant: 30),
            movieDetailsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            movieDetailsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmDescriptionLabel() {
        containerView.addSubview(filmDescriptionLabel)
        filmDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmDescriptionLabel.text = "Описание"
        filmDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            filmDescriptionLabel.topAnchor.constraint(equalTo: movieDetailsLabel.bottomAnchor, constant: 10),
            filmDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
            filmDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmDescriptionTextLabel() {
        containerView.addSubview(filmDescriptionTextLabel)
        filmDescriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmDescriptionTextLabel.font = UIFont.systemFont(ofSize: 14)
        filmDescriptionTextLabel.numberOfLines = 0
    
        
        
        NSLayoutConstraint.activate([
            filmDescriptionTextLabel.topAnchor.constraint(equalTo: filmDescriptionLabel.bottomAnchor),
            filmDescriptionTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmDescriptionTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmShowLabel() {
        containerView.addSubview(filmShowLabel)
        filmShowLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmShowLabel.text = "Дата премьеры"
        filmShowLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            filmShowLabel.topAnchor.constraint(equalTo: filmDescriptionTextLabel.bottomAnchor, constant: 10),
            filmShowLabel.heightAnchor.constraint(equalToConstant: 20),
            filmShowLabel.topAnchor.constraint(equalTo: filmDescriptionTextLabel.bottomAnchor, constant: 10),
            filmShowLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmShowLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmShowDateLabel() {
        containerView.addSubview(filmShowDateLabel)
        filmShowDateLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmShowDateLabel.font = UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            filmShowDateLabel.topAnchor.constraint(equalTo: filmShowLabel.bottomAnchor),
            filmShowDateLabel.heightAnchor.constraint(equalToConstant: 20),
            filmShowDateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmShowDateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmAuthorLabel() {
        containerView.addSubview(filmAuthorLabel)
        filmAuthorLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmAuthorLabel.text = "Режиссер"
        filmAuthorLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            filmAuthorLabel.topAnchor.constraint(equalTo: filmShowDateLabel.bottomAnchor, constant: 5),
            filmAuthorLabel.heightAnchor.constraint(equalToConstant: 20),
            filmAuthorLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmAuthorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmAuthorNameLabel() {
        containerView.addSubview(filmAuthorNameLabel)
        filmAuthorNameLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmAuthorNameLabel.font = UIFont.systemFont(ofSize: 14)
        filmAuthorNameLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            filmAuthorNameLabel.topAnchor.constraint(equalTo: filmAuthorLabel.bottomAnchor),
            filmAuthorNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmAuthorNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmCastLabel() {
        containerView.addSubview(filmCastLabel)
        filmCastLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmCastLabel.text = "В ролях"
        filmCastLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            filmCastLabel.topAnchor.constraint(equalTo: filmAuthorNameLabel.bottomAnchor, constant: 5),
            filmCastLabel.heightAnchor.constraint(equalToConstant: 20),
            filmCastLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmCastLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    
    func setupFilmCastTextLabel() {
        containerView.addSubview(filmCastTextLabel)
        filmCastTextLabel.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmCastTextLabel.font = UIFont.systemFont(ofSize: 14)
        filmCastTextLabel.textAlignment = .left
        filmCastTextLabel.numberOfLines = 0


        NSLayoutConstraint.activate([
            filmCastTextLabel.topAnchor.constraint(equalTo: filmCastLabel.bottomAnchor),
            filmCastTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            filmCastTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            filmCastTextLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120)
        ])
    }
    
}

extension FilmViewController: FilmViewInput{
    func configure(with model: FilmViewModel) {
        filmImage.image = model.filmImage
        filmCastTextLabel.text = model.filmCastTextLabel
        filmTitle.text = model.filmTitle
        filmAuthorNameLabel.text = model.filmAuthorNameLabel
        filmShowDateLabel.text = model.filmShowDateLabel
        filmDescriptionTextLabel.text = model.filmDescriptionTextLabel
        
        let movieDetailsLabelTime = model.movieDetailsLabelTime
        let movieDetailsLabelGenre = model.movieDetailsLabelGenre
        let movieDetailsLabelAge = model.movieDetailsLabelAge
        movieDetailsLabel.text = movieDetailsLabelTime + " • " + movieDetailsLabelGenre + " • " + movieDetailsLabelAge
        
        filmYearLabel.text = model.filmYearLabel
        filmCountryLabel.text = model.filmCountryLabel
        kinopoiskScoreLabel.text = model.kinopoiskScoreLabel
        scoreLabel.text = model.scoreLabel
        scoreLabel.backgroundColor = model.scoreColor
    }
}

extension FilmViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}

extension FilmViewController: UIScrollViewDelegate {
    
}