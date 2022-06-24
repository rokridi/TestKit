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

    private var homePageType: HomePageType = .homePageWithActivityIndicator

    func testGetActivityIndicator_WithCorrectIdentifier_ShouldSucceed() {
        self.startApp()
        self.tester
            .getActivityIndicator(with: "activityIndicatorIdentifier")

    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
