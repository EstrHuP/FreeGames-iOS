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
        let interactor = UserFormInteractor()
        interactor.userProvider = NetworkUserProvider()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        
        return viewController
    }
}
