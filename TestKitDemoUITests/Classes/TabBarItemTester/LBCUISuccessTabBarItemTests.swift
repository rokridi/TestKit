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

    override func setUp() {
        self.homePageType = .homePageWithTabBar
        super.setUp()
    }

    func test_tabBarItem() {
        // GIVEN

        // WHEN
        self.startApp(true)

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


}
