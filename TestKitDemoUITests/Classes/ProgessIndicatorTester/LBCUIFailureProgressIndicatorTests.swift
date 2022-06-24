//
//  LBCUIFailureProgressIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureProgressIndicatorTests: LBCUITestCase{
    private var homePageType: HomePageType = .homePageWithProgessView

    func testGetWrongProgessView() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getProgressIndicator(with: "wrongIdentifier")
        }

    }

    func testCheckWrongProgessViewValue() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester
                .getProgressIndicator(with: "progressViewIdentifier")
                .validate(progressValue: 0.2)
        }

    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
