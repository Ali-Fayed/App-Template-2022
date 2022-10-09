//
//  NetworkManger.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Alamofire
struct NetworkManger {
    static let shared = NetworkManger()
    func performRequest<T: Decodable>(requestValues: NetworkRequestValues<T>, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(requestValues.requestData)
            .validate(statusCode: 200...300)
            .responseDecodable(of: T.self, completionHandler: { response in
                switch response.result {
                case .success(_):
                    guard let value = response.value else {return}
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
        })
    }
}

