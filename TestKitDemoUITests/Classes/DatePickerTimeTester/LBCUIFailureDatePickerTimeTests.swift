//
//  LBCUIFailureDatePickerTimeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 10/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureDatePickerTimeTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithDatePicker
        super.setUp()
        self.startApp()
    }

    func testGetDatePicker_WrongIdentifier() {
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "wrongIdentifier")
        }
    }
}
