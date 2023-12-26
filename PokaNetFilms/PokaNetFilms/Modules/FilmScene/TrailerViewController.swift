//
//  TrailerViewController.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 27.12.2023.
//

import Foundation
import UIKit
import WebKit

final class TrailerViewController: UIViewController {
    
    var model: FilmViewModel?
    let webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupWebView()
        
        if let url = URL(string: "https://www.youtube.com/embed/lEBAnyWQsOo") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("[DEBUG]: FATAL ERROR")
    }
}

extension TrailerViewController{
    func setupWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
