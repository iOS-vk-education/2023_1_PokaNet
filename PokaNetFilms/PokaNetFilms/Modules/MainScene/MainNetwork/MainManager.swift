//
//  MainManager.swift
//  PokaNetFilms
//
//  Created by Кирилл Давыденков on 26.12.23..
//

import Foundation
import Alamofire
import SwiftUI

final class MainManager {
    static let shared = MainManager()
    private init()  {}
    
    private let searchUrl = "\(APIConstants.baseUrl)/v1.4/movie"
    private let networkService = AlamofireNetworkService()
    
    func searchFilms(page: Int, limit: Int, completion: @escaping (Result<MainFilmResponse, Error>) -> Void) {
        
        var urlComponents = URLComponents(string: searchUrl)
        let queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "notNullFields", value: "name"),
            URLQueryItem(name: "notNullFields", value: "ageRating"),
            URLQueryItem(name: "notNullFields", value: "poster.url"),
            URLQueryItem(name: "notNullFields", value: "persons.name"),
            URLQueryItem(name: "notNullFields", value: "genres.name")]
        
        urlComponents?.queryItems = queryItems
        
        guard let fullURL = urlComponents?.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
   
        networkService.request(fullURL.absoluteString) { response in
            switch response.result {
            case .success(let data):
                do {
                    let movie = try JSONDecoder().decode(MainFilmResponse.self, from: data)
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
