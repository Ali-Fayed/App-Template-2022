//
//  Tab2Coordinator.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//
import Foundation
import XCoordinator

enum SettingsTabRoute: Route {
    case secondTab
}
class SettingsCoordinator: NavigationCoordinator<SettingsTabRoute> {
    init() {
        super.init(initialRoute: .secondTab)
    }
    override func prepareTransition(for route: SettingsTabRoute) -> NavigationTransition {
        switch route {
        case .secondTab:
            let viewController = SettingsViewController.instaintiate(on: .main)
            viewController.navigationItem.title = "Settings"
            viewController.viewModel.router = unownedRouter
            return .push(viewController)
        }
    }
}
