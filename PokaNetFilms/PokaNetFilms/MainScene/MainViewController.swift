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
    
    
    private var model: MainUnitModel!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.minimumLineSpacing
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var models: [MainUnitModel] = []
    
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
    }
}


private extension MainViewController {
    func setup() {
        setupAppearance()
        setupLayout()
        setupCollectionView()
    }
    
    func setupAppearance() {
        view.backgroundColor = .green
        
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.backgroundColor = .yellow
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
    
    func numberOfCells(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Возвращаем количество ячеек
        return 4
    }
}

private extension MainViewController {
    enum Constants {
        static let horizontalInset: CGFloat = 32
        static let minimumLineSpacing: CGFloat = 16
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! MainCell
        // Настройка ячейки с данными
        return cell
    }
    // наследуемся для реализации методов коллекции
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 4
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout { // наследуемся для реализации методов коллекции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 20)
        return CGSize(width: cellWidth, height: cellWidth * 0.35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // задаем отступы сверху, слева, снизу и справа
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

extension MainViewController: MainViewInput { // настройка вью контроллера из презентера
    func configure(with model: MainViewModel) {
        //self.models = model.units
        collectionView.reloadData()
    }
}



