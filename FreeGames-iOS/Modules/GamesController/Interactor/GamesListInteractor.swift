//
//  GamesListInteractor.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import Alamofire

class GamesListInteractor: GamesInteractorContract {
    var output: GamesInteractorOutputContract?
    
    func fetchGames() {
        let url = ServicesConstants.baseURL
        let request = URLRequest(url: NSURL(string: url)! as URL)
        
        AF.request(request).responseDecodable { (response: DataResponse<[Game], AFError>) in
            switch response.result {
            case .success(let games):
                self.output?.didFetchGames(games: games)
                print(games)
            case .failure: self.output?.didFailed()
            }
        }.validate()
    }
}
