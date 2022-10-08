//
//  AppCoordinator.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
import Foundation
import XCoordinator

enum AppRoute: Route {
    case tabBarController
}
class AppCoordinator: NavigationCoordinator<AppRoute> {
    init() {
        super.init(initialRoute: .tabBarController)
    }
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .tabBarController:
            let tabCoordinator = HomeTabBarCoordinator()
            tabCoordinator.rootViewController.modalPresentationStyle = .overFullScreen
            return .present(tabCoordinator)
        }
    }
}
