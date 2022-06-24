//
//  LBCUISuccessDatePickerCountDownTimerTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 04/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessDatePickerCountDownTimerTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithDatePicker

    func testGetDatePicker() {
        self.startApp()
        self.tester.getDatePickerTypeCountdownTimer(with: "datePickerCountDownTimerIdentifier")
            .validate(.hour(value: 15))
            .validate(.minutes(value: 30))
            .move(.hour(value: 20))
            .move(.minutes(value: 15))
            .validate(.hour(value: 20))
            .validate(.minutes(value: 15))
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
