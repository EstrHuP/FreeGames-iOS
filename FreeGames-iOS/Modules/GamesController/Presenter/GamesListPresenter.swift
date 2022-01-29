//
//  GamesListPresenter.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation

class GamesListPresenter: GamesPresenterContract {
    weak var view: GamesViewContract?
    var interactor: GamesInteractorContract?
    var wireframe: GamesListWireframeContract?
    
    private var games = [Game]() {
        didSet {
            view?.reloadData()
        }
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchAllGames()
    }
    
    var numGamesRow: Int {
        return games.count
    }
    
    func cellGamesViewModel(at indexPath: IndexPath) -> GamesCollectionCellViewModel {
        let game = games[indexPath.row]
        return game.toListGamesCellViewModel
    }
    
    func didSelectGameDetail(at indexPath: IndexPath) {
        let game = games[indexPath.row]
        wireframe?.navigate(to: game)
    }
}

extension GamesListPresenter: GamesInteractorOutputContract {
    func didFetchGames(games: [Game]) {
        self.games = games
    }
    
    func didFailed() {
        //TODO: Mejorar mensaje de error
        print("Error")
    }
}
