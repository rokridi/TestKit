//
//  LBCUIFailureButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 18/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureButtonTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithButton
        super.setUp()
    }

    func testButton_WrongIdentifier() {
        // GIVEN
        self.homePageType = .homePageWithButton

        // THEN
        XCTExpectFailure {
            self.tester.getButton(with: "wrongIdentifier")
        }
    }

    func testButton_validate_value_failure() {
        // GIVEN
        self.homePageType = .homePageWithButton

        // WHEN
        self.startApp(true)

        // THEN
        XCTExpectFailure {
            self.tester.getButton(with: "buttonIdentifier")
                .validate(value: "Wrong value")
        }
    }

    func testButton_validate_enable_state_failure() {
        // GIVEN
        self.homePageType = .homePageWithButton

        // WHEN
        self.startApp(true)

        // THEN
        XCTExpectFailure {
            self.tester.getButton(with: "disableButtonIdentifier")
                .validate(isEnabled: true)
        }
    }

    func testButton_validate_disable_state_failure() {
        // GIVEN
        self.homePageType = .homePageWithButton

        // WHEN
        self.startApp(true)

        // THEN
        XCTExpectFailure {
            self.tester.getButton(with: "buttonIdentifier")
                .validate(isEnabled: false)
        }

    }


}
