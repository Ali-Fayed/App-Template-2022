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
    var homeViewDelegate: UpdateViewDelegate?
    var useCase: HomeUseCase
    var isSearching = false
    var usersData = [User]()
    init(useCase: HomeUseCase = HomeUseCase()) {
        self.useCase = useCase
    }
    func usersCount() -> Int {
        return usersData.count
    }
    func githubUsers(index: IndexPath) -> User {
        return usersData[index.row]
    }
    func handleBindingInSearchState(users: [User]) {
        if isSearching {
            self.usersData = users
            isSearching = false
        } else {
            self.usersData.append(contentsOf: users)
        }
    }
    func fetchUsers(requestValues: HomeViewRequestValues) {
        Task {
            do {
                let users = try await useCase.fetchUsers(requestValues: requestValues)
                handleBindingInSearchState(users: users)
                homeViewDelegate?.updateViewWithData()
            } catch {
                homeViewDelegate?.updateViewWithError(error: error)
            }
        }
    }
}
