//
//  GamesInteractorTests.swift
//  FreeGames-iOSTests
//
//  Created by Esther Huecas on 6/2/22.
//

import XCTest
@testable import FreeGames_iOS

class GamesInteractorTests: XCTestCase {
    
    class MockGamesProvider: GameProviderContract {
        let games: [Game] = [
            .init(id: 1, title: "fortnite", thumbnail: "", short_description: "asedfasdfasasdfasd", game_url: "", genre: "", platform: "", publisher: "", developer: "", release_date: "", freetogame_profile_url: ""),
            .init(id: 2, title: "catán", thumbnail: "", short_description: "masoijaqwera", game_url: "", genre: "", platform: "", publisher: "", developer: "", release_date: "", freetogame_profile_url: "")
        ]
        
        let gameDetail: GameDetail = .init(id: 1, title: "fortnite", thumbnail: "", status: "", short_description: "", description: "", game_url: "", genre: "", platform: "", publisher: "", developer: "", release_date: "", freetogame_profile_url: "", minimum_system_requirements: Requirements.init(os: "", processor: "", memory: "", graphics: "", storage: ""), screenshots: [Screenshots.init(id: 2, image: "")])
        
        
        
        var shouldFail = false
        
        func getAllGames(_ completion: @escaping (Result<[Game], GameProviderError>) -> ()) {
            if shouldFail {
                completion(.failure(.badUrl))
            } else {
                completion(.success(games))
            }
        }
        
        func getDetailGame(for showId: Int, _ completion: @escaping (Result<GameDetail, GameProviderError>) -> ()) {
            if shouldFail {
                completion(.failure(.badUrl))
            } else {
                completion(.success(gameDetail))
            }
        }
    }
    
    class MockedListInteractorOutput: GamesInteractorOutputContract {
        let expectation: XCTestExpectation
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        var games = [Game]()
        var didFailGames = false
        var gameDetail: GameDetail?
        var didFailDetailGame = false
        
        func didFetchGames(games: [Game]) {
            self.games = games
            expectation.fulfill()
        }
        
        func didFailed() {
            didFailGames = true
            expectation.fulfill()
        }
        
        func didFetchGameDetail(gameDetail: GameDetail) {
            self.gameDetail = gameDetail
            expectation.fulfill()
        }
        
        func didFailedDetail() {
            didFailDetailGame = true
            expectation.fulfill()
        }
    }
    
    func testShouldFetchGames() {
        let expectation = expectation(description: "test")
        
        let output = MockedListInteractorOutput(expectation: expectation)
        let provider = MockGamesProvider()
        let sut = GamesListInteractor()
        
        sut.gamesProvider = provider
        sut.output = output
        sut.fetchAllGames()
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
    
    func testShouldFetchDetailGame() {
        let expectation = expectation(description: "test detail game")
        
        let output = MockedListInteractorOutput(expectation: expectation)
        let provider = MockGamesProvider()
        let sut = GamesListInteractor()
        
        sut.gamesProvider = provider
        sut.output = output
        sut.fetchDetailGame(id: 1)
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
}
