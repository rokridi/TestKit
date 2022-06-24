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

    private var homePageType: HomePageType = .homePageWithToolbar

    func test_Toolbar_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getToolbar(with: "wrongIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
