//
//  LBCUIFailureToolbarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 04/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureToolbarTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithToolbar
        super.setUp()
    }

    func test_Toolbar_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getToolbar(with: "wrongIdentifier")
        }
    }
}
