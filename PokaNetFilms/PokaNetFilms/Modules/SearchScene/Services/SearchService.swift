//
//  NetworkService.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 20.12.2023.
//

import Alamofire
import Foundation

final class SearchService {
    static let shared = SearchService()
    private init() {}
     
    private let networkService = AlamofireNetworkService()
     
    func searchFilms(query: String, page: Int = 1, limit: Int = 10, completion: @escaping (Result<FilmResponse, Error>) -> Void) {
        let searchUrl = "\(APIConstants.baseUrl)/v1.4/movie/search"
         
        var urlComponents = URLComponents(string: searchUrl)
        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "query", value: query)
        ]
         
        urlComponents?.queryItems = queryItems
         
        guard let fullURL = urlComponents?.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        networkService.request(fullURL.absoluteString) { response in
            switch response.result {
            case .success(let data):
                do {
                    let movie = try JSONDecoder().decode(FilmResponse.self, from: data)
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
