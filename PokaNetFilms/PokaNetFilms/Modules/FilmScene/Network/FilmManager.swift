//
//  FilmManager.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 21.12.2023.
//
import Alamofire
import Foundation

final class FilmManager {
    static let shared = FilmManager()
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
