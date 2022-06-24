//
//  LBCUIFailureTabBarItemTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureTabBarItemTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTabBar
        super.setUp()
    }

    func test_get_tabBarItem_with_wrong_identifier() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getTabBarItem(with: "wrongItentifier")
        }
    }

    func test_get_tabBarItem_state_failure() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getTabBarItem(with: "tabBarItem1Identifier")
                .validateState(isSelected: false)
        }
    }

    func test_get_tabBarItem_text_failure() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getTabBarItem(with: "tabBarItem1Identifier")
                .validateText(value: "wrong text")
        }
    }

    func test_get_tabBarItem_update_state_failure() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            let tabBarItem1 = self.tester
                .getTabBarItem(with: "tabBarItem1Identifier")
            let tabBarItem2 = self.tester
                .getTabBarItem(with: "tabBarItem2Identifier")

            tabBarItem1
                .validateState(isSelected: true)
            tabBarItem2
                .validateState(isSelected: false)
            tabBarItem2
                .tap()
                .validateState(isSelected: false)
            tabBarItem1
                .validateState(isSelected: true)
        }

    }
}
