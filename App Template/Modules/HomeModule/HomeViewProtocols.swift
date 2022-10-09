//
//  Protocols.swift
//  App Template
//
//  Created by AliFayed on 09/10/2022.
//

import Foundation
protocol HomeViewUseCase {
    func fetchUsers(requestValues: HomeViewRequestValues) async throws -> ([User])
}
protocol UpdateViewDelegate {
    func updateViewWithData()
    func updateViewWithError(error: Error)
    func updateViewWithMoreData(indexPaths: [IndexPath])
    func refreshView()
}
struct HomeViewRequestValues {
    let page: Int
    let searchText: String
}
