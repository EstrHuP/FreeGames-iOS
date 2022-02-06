//
//  UserFormProviderTests.swift
//  FreeGames-iOSTests
//
//  Created by Esther Huecas on 6/2/22.
//

import XCTest
@testable import FreeGames_iOS

class UserFormProviderTests: XCTestCase {
    
    func testShouldFetchUserData() {
        let expectation = expectation(description: "")
        let sut = NetworkUserProvider()
        let url = URL(string: "")
        
        sut.getUser(for: url) { result in
            switch result {
            case .success(let user):
                XCTAssertFalse(((user.name?.isEmpty) != nil))
            case .failure(let error): XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testShouldFetchSaveUser() {
        let expectation = expectation(description: "")
        let sut = NetworkUserProvider()
        let user = User(name: "Test", lastName: "Testt", phone: "123456789", mail: "test@gmail.com", bio: "kl")
        let url = URL(string: "")
        
        sut.saveDataUser(for: user, with: url) { result in
            switch result {
            case .success(let user):
                XCTAssertFalse(((user.name?.isEmpty) != nil))
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
