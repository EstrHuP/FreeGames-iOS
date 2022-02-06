//
//  UserFormModelTests.swift
//  FreeGames-iOSTests
//
//  Created by Esther Huecas on 6/2/22.
//

import XCTest
@testable import FreeGames_iOS

class UserFormModelTests: XCTestCase {
    
    let user = User(name: "Test", lastName: "Testing model", phone: "12345678", mail: "test@test.com", bio: "something")
    
    func testUserModelValidName() {
        XCTAssertTrue(((user.name?.isReallyEmpty) != nil))
    }
    
    func testUserModelValidLastName() {
        XCTAssertTrue(((user.lastName?.isReallyEmpty) != nil))
    }
    
    func testUserModelValidPhone() {
        XCTAssertTrue(((user.phone?.isValidPhone) != nil))
    }
    
    func testUserModelValidMail() {
        XCTAssertTrue(((user.mail?.isValidEmail) != nil))
    }
    
    func testUserModelValidBio() {
        XCTAssertTrue(((user.bio?.isReallyEmpty) != nil))
    }
}
