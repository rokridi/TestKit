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

    override func setUp() {
        self.homePageType = .homePageWithTabBar
        super.setUp()
        self.startApp(true)
    }

    func testGetTabBar() {
        self.tester
            .getTabBar(with: "tabBarIdentifier")
    }


}
