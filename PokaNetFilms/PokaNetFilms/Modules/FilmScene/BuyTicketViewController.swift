//
//  BuyTicketViewController.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 28.02.2024.
//


import Foundation
import UIKit
import WebKit

final class TicketViewController: UIViewController {
    
    var id: String?
    var itSerial: String?
    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupWebView()
        
        var url = ""
        if itSerial == "true"{
            url = "https://www.kinopoisk.ru/series/\(id ?? "")"
        }
        else if itSerial == "false"{
            url = "https://www.kinopoisk.ru/film/\(id ?? "")"
        }
        if let url = URL(string: url) {
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

extension TicketViewController{
    func setupWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
}
