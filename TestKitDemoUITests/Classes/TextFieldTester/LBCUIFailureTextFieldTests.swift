//
//  LBCUIFailureTextFieldTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureTextFieldTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTextField
        super.setUp()
    }

    func test_TextField_wrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "wrongIdentifier")
        }
    }

    func test_TextField_validate_text_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_TextField_validate_placeholder_failure() {
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTextField(with: "textFieldIdentifier")
                .validate(placeholder: "This is a wrong placeholder")
        }
    }

    func test_TextField_fill_text_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .validate(value: "")
                .fill(with: "updateText")
                .validate(value: "XXX")
        }
    }

    func test_TextField_clear_text_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .fill(with: "updateText")
                .validate(value: "updateText")
                .clearText()
                .validate(value: "XXX")
        }
    }

    func test_focus_text_field_failed() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .focus()
            XCTAssert(self.app.keyboards.count == 0)
        }
    }

    func test_valide_number_regex_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .fill(with: "string text")
                .validateFormat(with: "^[0-9]+$")
        }
    }

    func test_valide_email_regex_email() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
                .fill(with: "aliou.sarr1234")
                .validateFormat(with: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        }
    }
}
