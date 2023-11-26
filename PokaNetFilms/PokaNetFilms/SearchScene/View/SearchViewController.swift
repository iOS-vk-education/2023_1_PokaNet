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
    var genreTable: UITableView!
    
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
        searchBar.placeholder = "Поиск..."
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(systemName: "wand.and.rays.inverse"), for: .bookmark, state: .normal)
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
    
    func setupGenreTable() {
        genreTable = UITableView()
        genreTable.translatesAutoresizingMaskIntoConstraints = false
        genreTable.delegate = self
        genreTable.dataSource = self
        genreTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(genreTable)
        
        NSLayoutConstraint.activate([
            genreTable.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            genreTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            genreTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            genreTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Genre.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Genre.allCases[indexPath.row].rawValue
        return cell
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.didChangeSearchText(searchText)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        setupGenreTable()
    }
}

extension SearchViewController: SearchViewInput {
    func configureSearch(with model: [SearchFilmsModel]) {
        print(model)
    }
}
