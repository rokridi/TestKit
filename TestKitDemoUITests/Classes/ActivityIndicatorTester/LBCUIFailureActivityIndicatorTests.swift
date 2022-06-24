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

    override func setUp() {
        self.homePageType = .homePageWithActivityIndicator
        super.setUp()
    }

    func testGetActivityIndicator_WithWrongIdentifier_ShouldFail() {
        self.startApp()
        _ = XCTExpectFailure {
            self.tester
                .getActivityIndicator(with: "wrongIdentifier")
        }
    }
}
