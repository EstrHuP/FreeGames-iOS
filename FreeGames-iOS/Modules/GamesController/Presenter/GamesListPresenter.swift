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
    
    private var detailGame: GameDetail?
    
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
        let gameId = games[indexPath.row].id
        interactor?.output = self
        interactor?.fetchDetailGame(id: gameId)
    }
}

extension GamesListPresenter: GamesInteractorOutputContract {
    func didFetchGameDetail(gameDetail: GameDetail) {
        self.detailGame = gameDetail
        wireframe?.navigate(to: gameDetail)
    }
    
    func didFailedDetail() {
        print("Error in Detail Screen")
    }
    
    func didFetchGames(games: [Game]) {
        self.games = games
    }
    
    func didFailed() {
        print("Error in All games Screen")
    }
}
