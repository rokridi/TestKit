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
    private var homePageType: HomePageType = .homePageWithTabBar

    func test_get_tabBar_with_wrong_identifier() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getTabBar(with: "wrongIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
