//
//  LBCUISuccessButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 17/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessButtonTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithButton
        super.setUp()
    }

    func testButton() {
        // GIVEN
        self.homePageType = .homePageWithButton

        // THEN
        self.tester.getButton(with: "buttonIdentifier")
            .validate(value: "C")
            .validate(isEnabled: true)
            .tap()
            .validate(value: "PRESSED")
        self.tester.getButton(with: "disableButtonIdentifier")
            .validate(value: "DISABLE BUTTON")
            .validate(isEnabled: false)
    }
}
