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
}

protocol GamesInteractorContract {
    var output: GamesInteractorOutputContract? {get set}
    func fetchGames()
}

protocol GamesInteractorOutputContract {
    func didFetchGames(games: [Game])
    func didFailed()
}

