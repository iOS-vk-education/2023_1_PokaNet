//
//  NetworkService.swift
//  PokaNetFilms
//
//  Created by Grigory Don on 21.12.2023.
//

import Alamofire
import Foundation

protocol NetworkService {
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void)
}

class AlamofireNetworkService: NetworkService {
    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void) {
        let headers:[String:String] = ["X-API-KEY":"T2ZRT4Z-82M49QD-HM64Y1X-6HBP3X9"]
        AF.request(url, headers: .init(headers)).validate().responseData(completionHandler: completion)
    }
}
