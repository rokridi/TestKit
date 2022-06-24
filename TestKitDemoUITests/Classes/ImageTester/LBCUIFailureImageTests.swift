//
//  LBCUIFailureImageTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureImageTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithImage

    func test_get_image_wrong_identifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getImage(with: "wrongIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
