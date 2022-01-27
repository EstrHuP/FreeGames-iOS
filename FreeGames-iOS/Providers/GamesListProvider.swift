//
//  GamesListProvider.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import Foundation
import Alamofire

enum GamesListProviderError: Error {
    case generic(Error?)
}

protocol GamesListProviderContract {
    func getAllGames(_ completion: @escaping (Result<[Game], GamesListProviderError>) -> ())
}

class NetworkGamesListProvider: GamesListProviderContract {
    var games = [Game]()
    
    private let session: Session
    init(session: Session = .default) {
        self.session = session
    }
    
    func getAllGames(_ completion: @escaping (Result<[Game], GamesListProviderError>) -> ()) {
        let url = ServicesConstants.baseURL
        
        let request = URLRequest(url: NSURL(string: url)! as URL)
        session.request(request).responseDecodable { [weak self] (response: DataResponse<[Game], AFError>) in
            switch response.result {
            case .success(let games):
                self?.games = games
                completion(.success(games))
            case .failure(let error): completion(.failure(.generic(error)))
            }
        }
    }
}
