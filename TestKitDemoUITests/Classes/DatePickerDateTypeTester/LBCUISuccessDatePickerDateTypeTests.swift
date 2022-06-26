//
//  LBCUISuccessDatePickerDateTypeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessDatePickerDateTypeTests: LBCUITestCase {
    override func setUp() {
        self.homePageType = .homePageWithDatePicker
        super.setUp()
        self.startApp()
    }

    func testDatePicker() {
        self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
            .validate(.day(value: 14))
            .validate(.month(value: "January"))
            .validate(.year(value: 2021))
            .move(.day(value: 20))
            .move(.month(value: "March"))
            .move(.year(value: 2010))
            .validate(.day(value: 20))
            .validate(.month(value: "March"))
            .validate(.year(value: 2010))
    }
}
