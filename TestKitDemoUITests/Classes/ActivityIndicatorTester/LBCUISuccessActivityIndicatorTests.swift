//
//  LBCUISuccessActivityIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Poudja.canessane on 13/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessActivityIndicatorTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithActivityIndicator
        super.setUp()
        self.startApp()
    }

    func testGetActivityIndicator_WithCorrectIdentifier_ShouldSucceed() {
        self.tester
            .getActivityIndicator(with: "activityIndicatorIdentifier")

    }
}
