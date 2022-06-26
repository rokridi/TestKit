//
//  LBCUIFailureTabBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureTabBarTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTabBar
        super.setUp()
        self.startApp(true)
    }

    func test_get_tabBar_with_wrong_identifier() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getTabBar(with: "wrongIdentifier")
        }
    }
}
