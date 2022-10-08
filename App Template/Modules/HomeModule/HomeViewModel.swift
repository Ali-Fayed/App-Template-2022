//
//  HomeViewModel.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import XCoordinator

class HomeViewModel {
    var router: UnownedRouter<HomeTabRoute>?
    var usersData = [User]()
    var isSearching = false
    func usersCount() -> Int {
        return usersData.count
    }
    func githubUsers(index: IndexPath) -> User {
        return usersData[index.row]
    }
    func fetchUsers(page: Int, searchText: String) async throws {
        let users: [User] = try await withCheckedThrowingContinuation({ continuation in
            NetworkManger.shared.performRequest(dataModel: Users.self, requestData: RequestRouter.searchUsers(page, searchText)) { result in
                switch result {
                case .success(let users):
                    // Resume with fetched users
                    continuation.resume(returning: users.items)
                case .failure(let error):
                    // Resume with error
                    continuation.resume(throwing: error)
                }
            }
        })
        if isSearching {
            self.usersData = users
            isSearching = false
        } else {
            self.usersData.append(contentsOf: users)
        }
    }
}
