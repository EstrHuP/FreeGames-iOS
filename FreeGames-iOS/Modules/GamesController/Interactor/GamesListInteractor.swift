//
//  GamesListInteractor.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import Alamofire

class GamesListInteractor: GamesInteractorContract {
    
    weak var output: GamesInteractorOutputContract?
    var gamesProvider: GameProviderContract?
    
    func fetchAllGames() {
        gamesProvider?.getAllGames({ result in
            switch result {
            case .success(let games):
                self.output?.didFetchGames(games: games)
            case .failure: self.output?.didFailed()
            }
        })
    }
    
    func fetchDetailGame(id: Int) {
        gamesProvider?.getDetailGame(for: id, { result in
            switch result {
            case .success(let detailGame):
                self.output?.didFetchGameDetail(gameDetail: detailGame)
            case .failure: self.output?.didFailedDetail()
            }
        })
    }
}
