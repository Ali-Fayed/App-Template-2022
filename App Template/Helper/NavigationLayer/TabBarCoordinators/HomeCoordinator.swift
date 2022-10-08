//
//  Tab1Coordinator.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import XCoordinator

enum HomeTabRoute: Route {
    case firstTab
}
class HomeCoordinator: NavigationCoordinator<HomeTabRoute> {
    init() {
        super.init(initialRoute: .firstTab)
    }
    override func prepareTransition(for route: HomeTabRoute) -> NavigationTransition {
        switch route {
        case .firstTab:
            let viewController = HomeViewController.instaintiate(on: .main)
            viewController.navigationItem.title = "Home"
            viewController.viewModel.router = unownedRouter
            return .push(viewController)
        }
    }
}
