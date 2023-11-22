//
//  FilmViewController.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 22.11.2023.
//

import Foundation
import UIKit

final class FilmViewController: UIViewController {
    
    let FilmTitle = UILabel()
    private let output : FilmViewOutput
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        
        setupFilmLabel()
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
        view.addSubview(FilmTitle)
        FilmTitle.text = "Дурные деньги"
        FilmTitle.font = UIFont.systemFont(ofSize: 30)
        FilmTitle.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        FilmTitle.textAlignment = .center //текст по центру
        FilmTitle.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            FilmTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            FilmTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            FilmTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            FilmTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
}

extension FilmViewController: FilmViewInput{
    
}
