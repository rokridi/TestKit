//
//  LBCUISuccessProgressIndicatorTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessProgressIndicatorTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithProgessView

    func testGetProgessView() {
        // GIVEN

        // WHEN
        self.startApp()

        // THEN
        self.tester
            .getProgressIndicator(with: "progressViewIdentifier")
            .validate(progressValue: 0.5)
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
