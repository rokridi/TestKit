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

    private var homePageType: HomePageType = .homePageWithPicker

    func test_GetPickerElement_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getPicker(with: "wrongIdentifier")
        }
    }

    func test_Picker_UpdateFailure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getPicker(with: "pickerIdentifier")
                .validate(textValue: "First")
                .move(toTextValue: "Third")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
