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
     
    private let searchUrl = "\(APIConstants.baseUrl)/v1.4/movie/search"
    private let genreSearchUrl = APIConstants.baseUrl + APIConstants.genreSearchUrl
    private let networkService = AlamofireNetworkService()
     
    func searchFilms(query: String, page: Int, limit: Int, completion: @escaping (Result<FilmResponse, Error>) -> Void) {
         
        var urlComponents = URLComponents(string: searchUrl)
        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "notNullFields", value: "name"),
            URLQueryItem(name: "notNullFields", value: "genre.name"),
            URLQueryItem(name: "notNullFields", value: "poster.url"),
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
    
    func searchFilmsByGenre(genreName: String, page: Int, limit: Int, completion: @escaping (Result<FilmResponse, Error>) -> Void) {
        var urlComponents = URLComponents(string: genreSearchUrl)

        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "genres.name", value: genreName)
        ]
        
        urlComponents?.queryItems = queryItems
        
        guard let fullUrl = urlComponents?.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        print(fullUrl)
        
        networkService.request(fullUrl.absoluteString) { response in
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
