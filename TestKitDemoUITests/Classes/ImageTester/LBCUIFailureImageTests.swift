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

    override func setUp() {
        self.homePageType = .homePageWithImage
        super.setUp()
        self.startApp()
    }

    func test_get_image_wrong_identifier() {
        XCTExpectFailure {
            self.tester
                .getImage(with: "wrongIdentifier")
        }
    }
}
