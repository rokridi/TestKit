//
//  LBCUISuccessDatePickerDateAndTimeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 10/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessDatePickerDateAndTimeTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithDatePicker

    func testGetDatePicker() {
        self.startApp()
        self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
            .validate(.date(value: "Thu, Jan 14"))
            .validate(.hour(value: 3))
            .validate(.minutes(value: 30))
            .validate(.meridiem(type: .pm))
            .move(.date(value: "Mar 4"))
            .move(.hour(value: 8))
            .move(.minutes(value: 5))
            .move(.meridiem(type: .am))
            .validate(.date(value: "Thu, Mar 4"))
            .validate(.hour(value: 8))
            .validate(.minutes(value: 5))
            .validate(.meridiem(type: .am))
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
