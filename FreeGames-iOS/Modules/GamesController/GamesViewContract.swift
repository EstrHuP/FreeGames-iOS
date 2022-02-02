//
//  GamesViewContract.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import UIKit

protocol GamesViewContract: UIViewController {
    var presenter: GamesPresenterContract? {get set}
    
    func reloadData()
}

protocol GamesPresenterContract: AnyObject {
    var view: GamesViewContract? {get set}
    var interactor: GamesInteractorContract? {get set}
    
    func viewDidLoad()
    
    var numGamesRow: Int {get}
    func cellGamesViewModel(at indexPath: IndexPath) -> GamesCollectionCellViewModel
    func didSelectGameDetail(at indexPath: IndexPath)
}

protocol GamesInteractorContract {
    var output: GamesInteractorOutputContract? {get set}
    var gamesProvider: GameProviderContract? {get set}
    func fetchAllGames()
    func fetchDetailGame(id: Int)
}

protocol GamesInteractorOutputContract: AnyObject {
    func didFetchGames(games: [Game])
    func didFailed()
    
    func didFetchGameDetail(gameDetail: GameDetail)
    func didFailedDetail()
}

protocol GamesListWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to gameDetail: GameDetail)
}

