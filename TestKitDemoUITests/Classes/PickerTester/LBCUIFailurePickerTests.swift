//
//  LBCUIFailurePickerTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailurePickerTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithPicker
        super.setUp()
        self.startApp(true)
    }

    func test_GetPickerElement_WrongIdentifier() {
        XCTExpectFailure {
            self.tester.getPicker(with: "wrongIdentifier")
        }
    }

    func test_Picker_UpdateFailure() {
        XCTExpectFailure {
            self.tester
                .getPicker(with: "pickerIdentifier")
                .validate(textValue: "First")
                .move(toTextValue: "Third")
        }
    }
}
