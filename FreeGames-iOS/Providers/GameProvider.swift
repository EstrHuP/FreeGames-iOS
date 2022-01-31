//
//  GameProvider.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import Foundation
import Alamofire

enum GameProviderError: Error {
    case generic(Error?)
}

protocol GameProviderContract {
    func getAllGames(_ completion: @escaping (Result<[Game], GameProviderError>) -> ())
    func getDetailGame(for showId: Int, _ completion: @escaping (Result<GameDetail, GameProviderError>) -> ())
}

class NetworkGamesListProvider: GameProviderContract {
    var games = [Game]()
    var gameDetail: GameDetail?
    
    private let session: Session
    init(session: Session = .default) {
        self.session = session
    }
    
    func getAllGames(_ completion: @escaping (Result<[Game], GameProviderError>) -> ()) {
        let url = String("\(Bundle.main.baseAPIUrl)\(ServicesConstants.shared.allGames)")
        let request = URLRequest(url: NSURL(string: url)! as URL)
        session.request(request).responseDecodable { [weak self] (response: DataResponse<[Game], AFError>) in
            switch response.result {
            case .success(let games):
                self?.games = games
                completion(.success(games))
            case .failure(let error): completion(.failure(.generic(error)))
            }
        }.validate()
    }
    
     func getDetailGame(for showId: Int, _ completion: @escaping (Result<GameDetail, GameProviderError>) -> ()) {
         let url = String("\(Bundle.main.baseAPIUrl)\(ServicesConstants.shared.gameId)\(showId)")
         let request = URLRequest(url: NSURL(string: url)! as URL)
         
         session.request(request).responseDecodable { [weak self] (response: DataResponse<GameDetail, AFError>) in
             switch response.result {
             case .success(let gameDetail):
                 self?.gameDetail = gameDetail
                 completion(.success(gameDetail))
             case .failure(let error): completion(.failure(.generic(error)))
             }
         }.validate()
     }
}
