//
//  LBCUISuccessTextFieldTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessTextFieldTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithTextField

    func test_TextField() {
        self.startApp()
        self.tester
            .getTextField(with: "textFieldIdentifier")
            .validate(value: "")
            .validate(placeholder: "This is a placeholder")
            .fill(with: "updateText")
            .validate(value: "updateText")
            .clearText()
            .validate(value: "")
    }

    func test_focus_text_field() {
        self.startApp()
        XCTAssert(self.app.keyboards.count == 0)
        self.tester
            .getTextField(with: "textFieldIdentifier")
            .focus()
        XCTAssert(self.app.keyboards.count > 0)
    }

    func test_valide_number_regex() {
        self.startApp()
        self.tester
            .getTextField(with: "textFieldIdentifier")
            .fill(with: "12345")
            .validateFormat(with: "^[0-9]+$")
    }

    func test_valide_email_regex() {
        self.startApp()
        self.tester
            .getTextField(with: "textFieldIdentifier")
            .fill(with: "firstname@host.com")
            .validateFormat(with: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
