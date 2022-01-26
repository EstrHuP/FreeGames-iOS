//
//  GamesControllerBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import UIKit

class GamesControllerBuilder {
    func build() -> UIViewController {
        
        let viewController = ListGamesViewController.createFromStoryBoard()
        
        //VIPER
        let presenter = GamesListPresenter()
        let interactor = GamesListInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        
        return viewController
        
    }
}
