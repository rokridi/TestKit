//
//  LBCUIFailureDatePickerDateTypeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureDatePickerDateTypeTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithDatePicker

    func test_get_datePicker_wrong_identifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "wrongIdentifier")
        }
    }

    func test_datePicker_wrong_day() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.day(value: 3))
        }
    }

    func test_datePicker_wrong_month() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.month(value: "March"))
        }
    }

    func test_datePicker_wrong_year() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.year(value: 2018))
        }
    }

    func test_datePicker_update_day_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.day(value: 14))
                .move(.day(value: 20))
                .validate(.day(value: 10))
        }
    }

    func test_datePicker_update_month_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.month(value: "January"))
                .move(.month(value: "March"))
                .validate(.month(value: "January"))
        }
    }

    func test_datePicker_update_year_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDate(with: "datePickerDateTypeIdentifier")
                .validate(.year(value: 2021))
                .move(.year(value: 2010))
                .validate(.year(value: 2021))
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
