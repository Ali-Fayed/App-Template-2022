//
//  HomeUseCase.swift
//  App Template
//
//  Created by AliFayed on 09/10/2022.
//

import Foundation
final class HomeUseCase: HomeViewUseCase {
    func fetchUsers(requestValues: HomeViewRequestValues) async throws -> ([User]) {
        let users: [User] = try await withCheckedThrowingContinuation({ continuation in
            let networkRequestValues = NetworkRequestValues(dataModel: UsersEntity.self, requestData: RequestRouter.searchUsers(requestValues.page, requestValues.searchText))
            NetworkManger.shared.performRequest(requestValues: networkRequestValues) { result in
                switch result {
                case .success(let users):
                    continuation.resume(returning: users.items)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
        return users
    }
}
