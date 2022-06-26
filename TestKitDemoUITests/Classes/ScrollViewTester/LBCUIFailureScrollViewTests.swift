//
//  LBCUIFailureScrollViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureScrollViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithScrollView
        super.setUp()
        self.startApp(true)
    }

    func test_GetScrollView_WrongIdentifier() {
        XCTExpectFailure {
            self.tester
                .getScrollView(with: "wrongIdentifier")
        }
    }
}
