//
//  LBCUISuccessPickerTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessPickerTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithPicker

    func test_Picker() {
        self.startApp()
        self.tester
            .getPicker(with: "pickerIdentifier")
            .validate(textValue: "First")
            .move(toTextValue: "Second")
            .validate(textValue: "Second")
            .move(toTextValue: "First")
            .validate(textValue: "First")

    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
