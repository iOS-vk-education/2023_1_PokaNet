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
        let headers:[String:String] = ["X-API-KEY":"0R0TTZN-0RNMGH6-GHE3B6W-WW8W416"]
        AF.request(url, headers: .init(headers)).validate().responseData(completionHandler: completion)
    }
}
