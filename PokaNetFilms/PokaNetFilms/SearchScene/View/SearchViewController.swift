//
//  SearchViewController.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 26.11.2023.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController {
    
    let output: SearchViewOutput
    
    var titleLable: UILabel!
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(output: SearchViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
private extension SearchViewController {
    func setupUI() {
        view.backgroundColor = .white
        setupTitle()
        setupSearchBar()
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.placeholder = "Search Films"
        view.addSubview(searchBar)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupTitle() {
        titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "Поиск"
        titleLable.textColor = .systemBlue
        titleLable.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLable.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleLable.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.didChangeSearchText(searchText)
    }
}

extension SearchViewController: SearchViewInput {
    func configureSearch(with model: [SearchFilmsModel]) {
        print(model)
    }
}
