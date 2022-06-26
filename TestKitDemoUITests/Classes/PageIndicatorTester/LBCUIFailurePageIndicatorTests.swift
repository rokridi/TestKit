//
//  LBCUIFailurePageIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailurePageIndicatorTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithPageIndicator
        super.setUp()
        self.startApp(true)
    }

    func testWrongPageIndicator() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getPageIndicator(with: "wrongIdentifier")
        }
    }

    func testWrongPageIndicatorItemNumbers() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getPageIndicator(with: "pageControlIdentifier")
                .validate(numberItems: 2)
        }
    }

    func testWrongPageIndicatorSelectIndex() {
        // THEN
        XCTExpectFailure {
            self.tester
                .getPageIndicator(with: "pageControlIdentifier")
                .validate(numberItems: 3)
                .validate(index: 3)
        }
    }
}
