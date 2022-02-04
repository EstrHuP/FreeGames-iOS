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
        let viewControllers = [buildGamesCollection(), buildUserForm(), buildPermission()]
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        return tabBarController
    }
}

private extension InitialControllerBuilder {
    func buildGamesCollection() -> UINavigationController {
        let collectionViewController = GamesControllerBuilder().build()
        let collectionTabBarItem = UITabBarItem(title: "tabbar_games".localized, image: .init(systemName: "calendar"), tag: 0)
        
        return buildNavigation(with: collectionViewController, tabBarItem: collectionTabBarItem)
    }
    
    func buildUserForm() -> UINavigationController {
        let formViewController = UserFormBuilder().build()
        let formTabBarItem = UITabBarItem(title: "tabbar_userProfile".localized, image: .init(systemName: "person.circle"), tag: 1)
        
        return buildNavigation(with: formViewController, tabBarItem: formTabBarItem)
    }
    
    func buildPermission() -> UINavigationController {
        let permissionViewController = PermissionControllerBuilder().build()
        let permissionTabBarItem = UITabBarItem(title:
                                                "tabbar_permissions".localized, image: .init(systemName: "lasso"), tag: 2)
        
        return buildNavigation(with: permissionViewController, tabBarItem: permissionTabBarItem)
    }
    
    func buildNavigation(with viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        
        return navigationController
    }
}
