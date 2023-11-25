//
//  MainViewController.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 19.11.23..
//

import Foundation
import UIKit

final class MainViewController: UIViewController {
    
    private let output: MainViewOutput
    private var model: MainViewModel!
    private var films: [MainMovieCellModel] = []
    private let header = MainHeaderView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    init(output: MainViewOutput) {
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
        collectionView.register(MainHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainHeaderView.identifier)
    }
}


private extension MainViewController {
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
        collectionView.register(MainMovieCell.self, forCellWithReuseIdentifier: "MainFilmCell")
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        constraintsCollectionView()
    }
    
    func constraintsCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainFilmCell", for: indexPath) as! MainMovieCell
        cell.configure(with: films[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainHeaderView.identifier, for: indexPath) as! MainHeaderView
        // настройка хедера
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 30)
    }

    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 4
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
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

extension MainViewController: MainViewInput { // настройка вью контроллера из презентера
    func configure(with model: MainViewModel) {
        self.model = model
        self.films = model.films
        collectionView.reloadData()
    }
}



