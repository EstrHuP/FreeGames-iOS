//
//  InitialControllerBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
        let tabBarController = UITabBarController()
        let viewControllers = [buildGamesCollection(), buildUserForm()]
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        return tabBarController
    }
}

private extension InitialControllerBuilder {
    func buildGamesCollection() -> UINavigationController {
        let collectionViewController = GamesControllerBuilder().build()
        let collectionTabBarItem = UITabBarItem(title: "All games", image: .init(systemName: "calendar"), tag: 0)
        
        return buildNavigation(with: collectionViewController, tabBarItem: collectionTabBarItem)
    }
    
    func buildUserForm() -> UINavigationController {
        let formViewController = UserFormBuilder().build()
        let formTabBarItem = UITabBarItem(title: "My profile", image: .init(systemName: "person.circle"), tag: 1)
        
        return buildNavigation(with: formViewController, tabBarItem: formTabBarItem)
    }
    
    func buildNavigation(with viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        
        return navigationController
    }
}
