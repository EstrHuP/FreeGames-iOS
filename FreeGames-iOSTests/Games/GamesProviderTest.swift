//
//  GamesProviderTest.swift
//  FreeGames-iOSTests
//
//  Created by Esther Huecas on 6/2/22.
//

import XCTest
@testable import FreeGames_iOS

class GamesProviderTest: XCTestCase {
    
    func testShouldFetchGames() {
        let expectation = expectation(description: "")
        let sut = NetworkGamesListProvider()
        
        sut.getAllGames { result in
            switch result {
            case .success(let games):
                print(games)
                XCTAssertFalse(games.isEmpty)
            case .failure(let error): XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testShouldFetchGameDetail() {
        let expectation = expectation(description: "")
        let sut = NetworkGamesListProvider()
        
        sut.getDetailGame(for: 1) { result in
            switch result {
            case .success(let gameDetail):
                print(gameDetail)
                XCTAssertFalse(gameDetail.title.isEmpty)
            case .failure(let error): XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
