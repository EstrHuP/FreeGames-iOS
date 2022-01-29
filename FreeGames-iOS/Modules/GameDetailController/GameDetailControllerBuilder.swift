//
//  GameDetailControllerBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import Foundation
import UIKit

class GameDetailControllerBuilder {
    func build(viewModel: GameDetailViewModel) -> UIViewController {
        let gameDetailViewController = GameDetailViewController.createFromStoryBoard()
        gameDetailViewController.viewModel = viewModel
        return gameDetailViewController
    }
}
