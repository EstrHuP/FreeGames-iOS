//
//  GamesListWireframe.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import Foundation
import UIKit

class GamesListWireframe: GamesListWireframeContract {
    weak var view: UIViewController?
    
    func navigate(to game: Game) {
        DispatchQueue.main.async {
            let detail = GameDetailControllerBuilder().build(viewModel: GameDetailViewModel.init(name: game.title, image: game.gameImageUrl))
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(detail, animated: true)
            } else {
                self.view?.present(detail, animated: false)
            }
        }
    }
}
