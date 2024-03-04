//
//  FavoriteFilmsViewController.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 29.02.2024.
//


import Foundation
import UIKit

final class FavoriteFilmsViewController: UIViewController {
    
    private let output: FavViewOutput
    private var model: FavViewModel?
    private var films: [FavMovieCellModel] = []
    private let header = FavHeaderView()
    private let filmsCount = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    init(output: FavViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        output.didLoadView()
    }
    
    //Без кингфишера это работает уебищно
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        setup()
//        output.didLoadView()
//        
//    }
}


private extension FavoriteFilmsViewController {
    func setup() {
        setupAppearance()
        setupLayout()
        setupCollectionView()
    }
    
    func setupAppearance() {
        view.backgroundColor = .white
        
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FavMovieCell.self, forCellWithReuseIdentifier: "FavMovieCell")
        collectionView.register(FavHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FavHeaderView.identifier)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        constraintsCollectionView()
    }
    
    func constraintsCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoriteFilmsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavMovieCell", for: indexPath) as! FavMovieCell
        cell.configure(with: films[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FavHeaderView.identifier, for: indexPath) as! FavHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 30)
    }

    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return films.count
    }
}

extension FavoriteFilmsViewController: UICollectionViewDelegate {
    // В данной реалзизации я могу нажать кнопку той ячейки, которую я уже открывал
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FavMovieCell
        cell.unlikeButton.addTarget(self, action: #selector(unlikeFilm), for: .touchUpInside)
        
        let movieID = films[indexPath.row].id
        output.didTapMovieCell(movieID)
    }
    
    @objc func unlikeFilm(_ sender: UIButton) {
        //реализация удаления из Избранного
        print("Я нажал на кнопку")
    }
}

extension FavoriteFilmsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 20)
        return CGSize(width: cellWidth, height: cellWidth * 0.44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // задаем отступы сверху, слева, снизу и справа
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension FavoriteFilmsViewController: FavViewInput { // настройка вью контроллера из презентера
    func configure(with model: FavViewModel) {
        self.model = model
        self.films = model.films
        
        collectionView.reloadData()
    }
}
