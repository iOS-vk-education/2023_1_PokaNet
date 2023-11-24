//
//  FilmViewController.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit

final class FilmViewController: UIViewController {
    
    let filmTitle = UILabel()
    let filmImage = UIImageView()
    
    private let output : FilmViewOutput
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        setupFilmLabel()
        setupFilmImage()
    }
    
    
    
    init(output: FilmViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("FATAL ERROR")
    }
}

extension FilmViewController{
    func setupFilmLabel() {
        view.addSubview(filmTitle)
        filmTitle.text = "Дурные деньги"
        filmTitle.font = UIFont.systemFont(ofSize: 30)
        filmTitle.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        filmTitle.textAlignment = .center //текст по центру
        filmTitle.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            filmTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            filmTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            filmTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            filmTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    func setupFilmImage() {
        view.addSubview(filmImage)
        filmImage.image = UIImage(named: "filmImage")
        filmImage.contentMode = .scaleAspectFill
        
        
        let filmHeight: CGFloat = UIScreen.main.bounds.height/3
        filmImage.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        NSLayoutConstraint.activate([
            filmImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            filmImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: filmHeight),
            filmImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            filmImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
    
}

extension FilmViewController: FilmViewInput{
    
}
