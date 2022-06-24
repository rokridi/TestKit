//
//  LBCUIFailureActivityIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Poudja.canessane on 13/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureActivityIndicatorTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithActivityIndicator

    func testGetActivityIndicator_WithWrongIdentifier_ShouldFail() {
        self.startApp()
        _ = XCTExpectFailure {
            self.tester
                .getActivityIndicator(with: "wrongIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
