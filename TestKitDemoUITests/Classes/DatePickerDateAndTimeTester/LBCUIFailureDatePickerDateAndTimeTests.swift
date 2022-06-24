//
//  LBCUIFailureDatePickerDateAndTimeTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 10/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureDatePickerDateAndTimeTests: LBCUITestCase {
    override func setUp() {
        self.homePageType = .homePageWithDatePicker
        super.setUp()
    }

    func testGetDatePicker_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "wrongIdentifier")
        }
    }

    func test_datePicker_hour_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.hour(value: 2))
        }
    }

    func test_datePicker_minutes_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.minutes(value: 9))
        }
    }

    func test_datePicker_date_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.date(value: "Fri, Jan 15"))
        }
    }

    func test_datePicker_meridiel_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.meridiem(type: .am))
        }
    }

    func test_datePicker_update_hour_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.hour(value: 15))
                .move(.hour(value: 20))
                .validate(.hour(value: 5))
        }

    }

    func test_datePicker_update_minutes_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.minutes(value: 30))
                .move(.minutes(value: 5))
                .validate(.minutes(value: 10))
        }
    }

    func test_datePicker_update_date_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.date(value: "Thu, Jan 14"))
                .move(.date(value: "Mar 4"))
                .validate(.date(value: "Thu, Jan 14"))
        }
    }

    func test_datePicker_update_merdiem_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeDateAndTime(with: "datePickerDateAndTimeIdentifier")
                .validate(.meridiem(type: .pm))
                .move(.meridiem(type: .am))
                .validate(.meridiem(type: .pm))
        }
    }


}
