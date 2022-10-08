//
//  TabBarCoordinator.swift
//  Cordinator Pattern Sample
//
//  Created by AliFayed on 08/10/2022.
//

import Foundation
import XCoordinator
enum TabBarRoute: Route {
    case homeTab
    case bookmarksTab
    case profileTab
    case settingsTab
}
class HomeTabBarCoordinator: TabBarCoordinator<TabBarRoute> {
    private let homeTabRouter: StrongRouter<HomeTabRoute>
    private let bookmarksTabRouter: StrongRouter<BookmarksTabRoute>
    private let profileTabRouter: StrongRouter<ProfileTabRoute>
    private let settingsTabRouter: StrongRouter<SettingsTabRoute>
        // MARK: - Initialization
    convenience init() {
        let homeTabCoordinator = HomeCoordinator()
        homeTabCoordinator.rootViewController.navigationBar.prefersLargeTitles = true
        homeTabCoordinator.rootViewController.navigationItem.largeTitleDisplayMode = .always
        homeTabCoordinator.rootViewController.tabBarItem =
        UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), selectedImage: UIImage(systemName: "homekit"))
        //
        let bookmarksTabCoordinator = BookmarksCoordinator()
        bookmarksTabCoordinator.rootViewController.navigationBar.prefersLargeTitles = true
        bookmarksTabCoordinator.rootViewController.navigationItem.largeTitleDisplayMode = .always
        bookmarksTabCoordinator.rootViewController.tabBarItem =
        UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "bookmark.fill"), selectedImage: UIImage(systemName: "bookmark.fill"))
        //
        let profileTabCoordinator = ProfileCoordinator()
        profileTabCoordinator.rootViewController.navigationBar.prefersLargeTitles = true
        profileTabCoordinator.rootViewController.navigationItem.largeTitleDisplayMode = .always
        profileTabCoordinator.rootViewController.tabBarItem =
        UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), selectedImage: UIImage(systemName: "person.fill"))
        //
        let settingsTabCoordinator = SettingsCoordinator()
        settingsTabCoordinator.rootViewController.navigationBar.prefersLargeTitles = true
        settingsTabCoordinator.rootViewController.navigationItem.largeTitleDisplayMode = .always
        settingsTabCoordinator.rootViewController.tabBarItem =
        UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape"))
        //

        self.init(homeRouter: homeTabCoordinator.strongRouter, settingsRouter: settingsTabCoordinator.strongRouter, bookmarksRouter: bookmarksTabCoordinator.strongRouter, profileRouter: profileTabCoordinator.strongRouter)
    }
    init(homeRouter: StrongRouter<HomeTabRoute>, settingsRouter: StrongRouter<SettingsTabRoute>, bookmarksRouter: StrongRouter<BookmarksTabRoute>, profileRouter: StrongRouter<ProfileTabRoute>) {
        self.homeTabRouter = homeRouter
        self.bookmarksTabRouter = bookmarksRouter
        self.profileTabRouter = profileRouter
        self.settingsTabRouter = settingsRouter
        super.init(tabs: [homeRouter, bookmarksRouter, profileRouter, settingsRouter], select: homeRouter)
    }
    // MARK: - Overrides
    override func prepareTransition(for route: TabBarRoute) -> TabBarTransition {
        switch route {
        case .homeTab:
            return .select(homeTabRouter)
        case .bookmarksTab:
            return .select(bookmarksTabRouter)
        case .profileTab:
            return .select(profileTabRouter)
        case .settingsTab:
            return .select(settingsTabRouter)

        }
    }
 }
