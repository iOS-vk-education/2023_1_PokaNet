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
    
    func fetch(id:Int) {
        networkService.request(baseURL + "/v1.4/movie/\(id)") { response in
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
