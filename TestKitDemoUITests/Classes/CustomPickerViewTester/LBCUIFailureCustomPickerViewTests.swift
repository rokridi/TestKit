//
//  LBCUIFailureCustomPickerViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureCustomPickerViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithCustomPickerView
        super.setUp()
    }

    func test_picker_wrong_identifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getPicker(with: "wrongIdentifier")
        }
    }

    func test_picker_validate_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getPicker(with: "customPickerView")
                .validate(textValue: "ITEM 1-3", atIndex: 0)
        }
    }

    func test_picker_update_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getPicker(with: "customPickerView")
                .validate(textValue: "ITEM 1-1", atIndex: 0)
                .move(toTextValue: "ITEM 1-5", atIndex: 0)
                .validate(textValue: "ITEM 1-3", atIndex: 0)
        }
    }
}
