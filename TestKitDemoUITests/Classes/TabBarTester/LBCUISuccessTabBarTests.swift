//
//  LBCUISuccessTabBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessTabBarTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithTabBar

    func testGetTabBar() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        self.tester
            .getTabBar(with: "tabBarIdentifier")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
