//
//  Game.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let title: String
    let thumbnail: String
    let short_description: String
    let game_url: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let release_date: String
    let freetogame_profile_url: String
}

extension Game {
    var toListGamesCellViewModel: GamesCollectionCellViewModel {
        GamesCollectionCellViewModel(name: title)
    }
}
