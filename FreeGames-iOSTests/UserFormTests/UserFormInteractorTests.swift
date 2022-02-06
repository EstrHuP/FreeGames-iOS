//
//  UserFormInteractorTests.swift
//  FreeGames-iOSTests
//
//  Created by Esther Huecas on 6/2/22.
//

import XCTest
@testable import FreeGames_iOS

class UserFormInteractorTests: XCTestCase {

    class MockUserProvider: UserProviderContract {
        let user: User = .init(name: "Test", lastName: "Provider", phone: "123456789", mail: "e@gmail.com", bio: "as")
        
        var shouldFail = false
        
        func getUser(for fileUrl: URL?, _ completion: @escaping (Result<User, Error>) -> ()) {
            if shouldFail {
                completion(.failure(Error.self as! Error))
            } else {
                completion(.success(user))
            }
        }
        
        func saveDataUser(for user: User, with fileURL: URL?, _ completion: @escaping (Result<User, Error>) -> ()) {
            if shouldFail {
                completion(.failure(Error.self as! Error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    class MockedUserInteractorOutput: UserFormInteractorOuputContract {
        let expectation: XCTestExpectation
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        var user: User?
        var didFailGetUser = false
        var didFailSaveUser = false
        
        func didFetchDataUser(user: User) {
            self.user = user
            expectation.fulfill()
        }
        
        func didFailedDataUser() {
            didFailGetUser = true
            expectation.fulfill()
        }
        
        func didFetchSaveDataUser(user: User) {
            self.user = user
            expectation.fulfill()
        }
        
        func didFailedSaveDataUser() {
            didFailSaveUser = true
            expectation.fulfill()
        }
    }
    
    func testShouldFetchUserData() {
        let expectation = expectation(description: "")
        
        let output = MockedUserInteractorOutput(expectation: expectation)
        let provider = MockUserProvider()
        let sut = UserFormInteractor()
        
        sut.userProvider = provider
        sut.output = output
        sut.fetchDataUser()
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
    
    func testShouldFetchSaveUser() {
        let expectation = expectation(description: "")
        let user: User = .init(name: "Test", lastName: "Provider Save", phone: "01235456", mail: "e@gmail.com", bio: "as")
        
        let output = MockedUserInteractorOutput(expectation: expectation)
        let provider = MockUserProvider()
        let sut = UserFormInteractor()
        
        sut.userProvider = provider
        sut.output = output
        sut.fetchSaveDataUser(user: user)
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }
    }
}
