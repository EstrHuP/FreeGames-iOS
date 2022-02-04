//
//  PermissionControllerBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 4/2/22.
//

import Foundation
import UIKit

class PermissionControllerBuilder {
    func build() -> UIViewController {
        let viewController = PermissionViewController.createFromStoryBoard()
        
        let presenter = PermissionPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        
        return viewController
    }
}
