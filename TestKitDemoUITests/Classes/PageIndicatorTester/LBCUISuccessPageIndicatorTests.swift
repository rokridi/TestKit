//
//  LBCUISuccessPageIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessPageIndicatorTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithPageIndicator
        super.setUp()
        self.startApp(true)
    }

    func testPageIndicator() {
        self.tester
            .getPageIndicator(with: "pageControlIdentifier")
            .validate(numberItems: 3)
            .validate(index: 2)
    }
}
