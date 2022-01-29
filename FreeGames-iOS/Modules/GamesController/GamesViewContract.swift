//
//  GamesViewContract.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import UIKit

protocol GamesViewContract: UIViewController {
    var presenter: GamesPresenterContract? {set get}
    
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
    var gamesProvider: GamesListProviderContract? {get set}
    func fetchAllGames()
}

protocol GamesInteractorOutputContract: AnyObject {
    func didFetchGames(games: [Game])
    func didFailed()
}

protocol GamesListWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to game: Game)
}

