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
    private var homePageType: HomePageType = .homePageWithDatePicker

    func testGetDatePicker_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "wrongIdentifier")
        }
    }

    func test_datePicker_hour_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.hour(value: 2))
        }
    }

    func test_datePicker_minutes_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.minutes(value: 9))
        }
    }

    func test_datePicker_meridiem_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.meridiem(type: .am))
        }
    }

    func test_datePicker_update_hour_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.hour(value: 15))
                .move(.hour(value: 20))
                .validate(.hour(value: 5))
        }
    }

    func test_datePicker_update_minutes_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.minutes(value: 30))
                .move(.minutes(value: 5))
                .validate(.minutes(value: 10))
        }
    }

    func test_datePicker_update_meridiem_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeTime(with: "datePickerTimeIdentifier")
                .validate(.meridiem(type: .am))
                .move(.meridiem(type: .pm))
                .validate(.meridiem(type: .am))
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
