//
//  LBCUIFailureDatePickerCountDownTimerTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureDatePickerCountDownTimerTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithDatePicker

    func testGetDatePicker_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "wrongIdentifier")
        }
    }

    func testGetDatePicker_WrongHour() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.hour(value: 2))
        }
    }

    func testGetDatePicker_WrongMinutes() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.minutes(value: 5))
        }
    }

    func testGetDatePicker_UpdateHour_Failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.hour(value: 15))
                .move(.hour(value: 20))
                .validate(.hour(value: 10))
        }
    }

    func testGetDatePicker_UpdateMinutes_Failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
                .validate(.minutes(value: 30))
                .move(.minutes(value: 15))
                .validate(.minutes(value: 4))
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
