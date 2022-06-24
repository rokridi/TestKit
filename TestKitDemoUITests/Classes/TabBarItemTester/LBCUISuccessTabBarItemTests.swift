//
//  LBCUISuccessTabBarItemTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessTabBarItemTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithTabBar

    func test_tabBarItem() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        let tabBarItem1 = self.tester
            .getTabBarItem(with: "tabBarItem1Identifier")
            .validateText(value: "Item 1")
            .validateState(isSelected: true)
        self.tester
            .getTabBarItem(with: "tabBarItem2Identifier")
            .validateText(value: "Item 2")
            .validateState(isSelected: false)
            .tap()
            .validateState(isSelected: true)
        tabBarItem1.validateState(isSelected: false)
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
