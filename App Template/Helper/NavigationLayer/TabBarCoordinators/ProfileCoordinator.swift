//
//  ProfileCoordinator.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import Foundation
import XCoordinator

enum ProfileTabRoute: Route {
    case profileTab
}
class ProfileCoordinator: NavigationCoordinator<ProfileTabRoute> {
    init() {
        super.init(initialRoute: .profileTab)
    }
    override func prepareTransition(for route: ProfileTabRoute) -> NavigationTransition {
        switch route {
        case .profileTab:
            let viewController = ProfileViewController.instaintiate(on: .main)
            viewController.navigationItem.title = "Profile"
            viewController.viewModel.router = unownedRouter
            return .push(viewController)
        }
    }
}

