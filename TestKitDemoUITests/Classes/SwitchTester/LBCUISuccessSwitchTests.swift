//
//  LBCUISuccessSwitchTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 28/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessSwitchTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSwitch
        super.setUp()
    }

    func testSwitchState() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        self.tester
            .getSwitch(with: "switchIdentifier")
            .validate(state: false)
            .toggle()
            .validate(state: true)
            .toggle()
            .validate(state: false)
    }
}
