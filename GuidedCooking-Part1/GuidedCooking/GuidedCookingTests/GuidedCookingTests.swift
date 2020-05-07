//
//  GuidedCookingTests.swift
//  GuidedCookingTests
//
//  Created by Kathleen Monje on 2/24/20.
//  Copyright © 2020 Kathleen Monje. All rights reserved.
//

import XCTest
@testable import GuidedCooking

class GuidedCookingTests: XCTestCase {

    //MARK: 'CookProgram' Class Tests

    func testCookProgramlInitializationSucceeds() {
        // string name
        let stringNameCookProgram = CookProgram.init(name: "Cheeseburger", photo: nil, description: nil)
        XCTAssertNotNil(stringNameCookProgram)
    }

    // Confirm that the `CookProgram` initializer returns nil when passed an emoji wrapped in a string as the name
    func testCookProgramInitializationWithEmojiFails() {
        let emojiCookProgram = CookProgram.init(name: "🍔", photo: nil, description: nil)
        XCTAssertNil(emojiCookProgram)
    }

    // Confirm that the `CookProgram` initializer returns nil when passed an empty name.
    func testCookProgramInitializationFails() {
        // Empty String
        let emptyStringCookProgram = CookProgram.init(name: "", photo: nil, description: nil)
        XCTAssertNil(emptyStringCookProgram)
    }

}
