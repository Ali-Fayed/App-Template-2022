//
//  BookmarksCoordinator.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import Foundation
import XCoordinator

enum BookmarksTabRoute: Route {
    case bookmarksTab
}
class BookmarksCoordinator: NavigationCoordinator<BookmarksTabRoute> {
    init() {
        super.init(initialRoute: .bookmarksTab)
    }
    override func prepareTransition(for route: BookmarksTabRoute) -> NavigationTransition {
        switch route {
        case .bookmarksTab:
            let viewController = BookmarksViewController.instaintiate(on: .main)
            viewController.navigationItem.title = "Bookmarks"
            viewController.viewModel.router = unownedRouter
            return .push(viewController)
        }
    }
}
