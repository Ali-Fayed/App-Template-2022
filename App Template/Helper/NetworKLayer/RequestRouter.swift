//
//  RequestRouter.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import Alamofire

enum RequestRouter {
    case searchUsers(Int, String)
    var baseURL: String {
        switch self {
        case .searchUsers:
            return "https://api.github.com"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .searchUsers:
            return .get
        }
    }
    var path: String {
        switch self {
        case .searchUsers:
            return "/search/users"
        }
    }
    var parameters: [String: String]? {
        switch self {
        case .searchUsers(let page, let query):
            return ["per_page": "40" ,"sort": "repositories", "order": "desc", "page": "\(page)" , "q": query]
        }
    }
}
// MARK: - URLRequestConvertible
    extension RequestRouter: URLRequestConvertible {
        func asURLRequest() throws -> URLRequest {
            let url = try baseURL.asURL().appendingPathComponent(path)
            var request = URLRequest(url: url)
            request.method = method
            if method == .get {
                request = try URLEncodedFormParameterEncoder()
                    .encode(parameters, into: request)
            }
            return request
        }
    }
