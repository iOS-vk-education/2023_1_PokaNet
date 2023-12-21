//
//  FilmManager.swift
//  PokaNetFilms
//
//  Created by Mike Ulanov on 21.12.2023.
//
import Alamofire
import Foundation

protocol NetworkService {
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void)
}

class AlamofireNetworkService: NetworkService {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = "https://api.kinopoisk.dev/"
    }
    
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void) {
        let url = baseURL + "v1.4/movie/555"
        let headers:[String:String] = ["X-API-KEY":"T2ZRT4Z-82M49QD-HM64Y1X-6HBP3X9"]
        AF.request(url, headers: .init(headers)).validate().responseData(completionHandler: completion)
        
    }
}

final class FilmManager {
    static let shared = FilmManager()
    private init(){}
    
    let networkService = AlamofireNetworkService(baseURL: "https://api.kinopoisk.dev/")
    func fetch() {
        networkService.request("") { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(DetailFilm.self, from: data)
                    print(response)
                } catch {
                    break //error
                }
            case let .failure(error):
                break // error
            }
        }
    }
}
