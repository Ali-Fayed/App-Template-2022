//
//  NetworkManger.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Alamofire
struct NetworkManger {
    static let shared = NetworkManger()
    enum FethcerError: Error {
        case missingData
    }
    func performRequest<T: Decodable>(dataModel: T.Type, requestData: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(requestData)
            .validate(statusCode: 200...300)
            .responseDecodable(of: T.self, completionHandler: { response in
                switch response.result {
                case .success(_):
                    guard let value = response.value else {
                        return completion(.failure(FethcerError.missingData))
                    }
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
        })
    }
}
