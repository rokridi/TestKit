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
    private var homePageType: HomePageType = .homePageWithPageIndicator

    func testPageIndicator() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        self.tester
            .getPageIndicator(with: "pageControlIdentifier")
            .validate(numberItems: 3)
            .validate(index: 2)
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
