//
//  UserFormBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation
import UIKit

class UserFormBuilder {
    func build() -> UIViewController {
        let viewController = UserFormViewController.createFromStoryBoard()
        
        let presenter = UserFormPresenter()
        
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
