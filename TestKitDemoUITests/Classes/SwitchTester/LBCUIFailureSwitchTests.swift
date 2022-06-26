//
//  LBCUIFailureSwitchTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

class LBCUIFailureSwitchTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSwitch
        super.setUp()
        self.startApp(true)
    }

    func testGetSwitchElementWithWrongIdenfitier() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getSwitch(with: "wrongIdentifier")
        }

    }

    func testSwitchWrongDefaultState() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getSwitch(with: "switchIdentifier")
                .validate(state: true)
        }
    }

    func testSwitchStateUpdateFailure() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getSwitch(with: "switchIdentifier")
                .validate(state: true)
                .toggle()
                .validate(state: true)
        }
    }
}
