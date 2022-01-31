//
//  GameDetail.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 29/1/22.
//

import Foundation

struct GameDetail: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let status: String
    let short_description: String
    let description: String
    let game_url: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let release_date: String
    let freetogame_profile_url: String
    let minimum_system_requirements: Requirements
    let screenshots: [Screenshots]
}

struct Requirements: Codable {
    let os: String?
    let processor: String?
    let memory: String?
    let graphics: String?
    let storage: String?
}

struct Screenshots: Codable {
    let id: Int?
    let image: String?
}

extension GameDetail {
    var gameDetailImageUrl: URL? {
        return URL(string: "https://www.freetogame.com/g/\(id)/thumbnail.jpg")
    }
    
    var toDetailGameViewModel: GameDetailViewModel {
        GameDetailViewModel(name: title, image: gameDetailImageUrl, descrip: description)
    }
}
