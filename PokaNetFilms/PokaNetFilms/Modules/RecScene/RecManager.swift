//
//  MainManager.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 26.12.23..
//

import Foundation
import Alamofire
import SwiftUI

final class RecomendationManager {
    static let shared = RecomendationManager()
    private init()  {}
    
    private let searchUrl = "\(APIConstants.baseUrl)/v1.4/movie"
    private let networkService = AlamofireNetworkService()
    
    func searchFilms(page: Int, limit: Int, completion: @escaping (Result<RecomendationFilmResponse, Error>) -> Void) {
        
        var urlComponents = URLComponents(string: searchUrl)
        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "notNullFields", value: "name&ageRating&poster.url&persons.name&genres.name&persons.enName"),
            URLQueryItem(name: "query", value: "top250"),
            URLQueryItem(name: "ticketsOnSale", value: "true"),
            URLQueryItem(name: "similarMovies.year", value: "2024")
        ]
        
        urlComponents?.queryItems = queryItems
        
        guard let fullURL = urlComponents?.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let year = ["2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        let url = "https://api.kinopoisk.dev/v1.4/movie?year=\(year.randomElement()!)&limit=50"
        print(url)
        // https://api.kinopoisk.dev/v1.4/movie?page=1&limit=100&lists=top250&ticketsOnSale=true
        //https://api.kinopoisk.dev/v1.4/movie?page=1&limit=100&lists=top250&year=2024
        networkService.request(url)
        { response in
            switch response.result {
            case .success(let data):
                do {
                    let movie = try JSONDecoder().decode(RecomendationFilmResponse.self, from: data)
                    completion(.success(movie))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                if let urlError = error.underlyingError as? URLError, urlError.code == .cancelled {
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}
