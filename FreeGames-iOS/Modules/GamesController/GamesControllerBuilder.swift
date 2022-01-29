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
        interactor.gamesProvider = NetworkGamesListProvider()
        
        let wireframe = GamesListWireframe()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        
        return viewController
        
    }
}
