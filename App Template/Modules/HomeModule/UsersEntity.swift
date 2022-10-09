//
//  UsersEntity.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
struct UsersEntity: Decodable {
    let items: [User]
}
struct User {
    let userName: String
    let userAvatar: String
    
    enum UsersCodingKeys: String, CodingKey {
        case userName = "login"
        case userAvatar = "avatar_url"
    }
}
extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UsersCodingKeys.self)
        userName = try container.decode(String.self, forKey: .userName)
        userAvatar = try container.decode(String.self, forKey: .userAvatar)
    }
}
