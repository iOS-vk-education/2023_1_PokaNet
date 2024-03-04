//
//  MainManager.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 26.12.23..
//


import Alamofire
import Foundation

final class FavManager {
    static let shared = FavManager()
    private init(){}
    
    let networkService = AlamofireNetworkService()
    let baseURL = APIConstants.baseUrl
    
    func fetchData(id: Int, completion: @escaping (Result<DetailFilm, Error>) -> Void) {
        networkService.request(baseURL + "/v1.4/movie/\(id)") { response in
            switch response.result {
            case .success(let data):
                print(data)
                let decoder = JSONDecoder()
                do {
                    let film = try decoder.decode(DetailFilm.self, from: data)
                    completion(.success(film))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}


//final class FavManager {
//    static let shared = FavManager()
//    private init()  {}
//
//    private let searchUrl = "\(APIConstants.baseUrl)/v1.4/movie"
//    private let networkService = AlamofireNetworkService()
//
//    func searchFilms(page: Int, limit: Int, completion: @escaping (Result<MainFilmResponse, Error>) -> Void) {
//
//        var urlComponents = URLComponents(string: searchUrl)
//        let queryItems = [
//            URLQueryItem(name: "page", value: String(page)),
//            URLQueryItem(name: "limit", value: String(limit)),
//            URLQueryItem(name: "notNullFields", value: "name&ageRating&poster.url&persons.name&genres.name&persons.enName"),
//            URLQueryItem(name: "query", value: "top250"),
//            URLQueryItem(name: "ticketsOnSale", value: "true"),
//            URLQueryItem(name: "similarMovies.year", value: "2024")
//        ]
//
//        urlComponents?.queryItems = queryItems
//
//        guard let fullURL = urlComponents?.url else {
//            completion(.failure(URLError(.badURL)))
//            return
//        }
//// https://api.kinopoisk.dev/v1.4/movie?page=1&limit=100&lists=top250&ticketsOnSale=true
////https://api.kinopoisk.dev/v1.4/movie?page=1&limit=100&lists=top250&year=2024
//        networkService.request("https://api.kinopoisk.dev/v1.4/movie?year=2024") { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    let movie = try JSONDecoder().decode(MainFilmResponse.self, from: data)
//                    completion(.success(movie))
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                if let urlError = error.underlyingError as? URLError, urlError.code == .cancelled {
//                } else {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
//}
