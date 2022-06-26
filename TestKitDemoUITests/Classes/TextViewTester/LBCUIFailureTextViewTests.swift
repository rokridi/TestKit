//
//  LBCUIFailureTextViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureTextViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTextView
        super.setUp()
        self.startApp(true)
    }

    func test_textView_wrongIdentifier() {

        XCTExpectFailure {
            self.tester
                .getTextView(with: "wrongIdentifier")
        }
    }

    func test_textView_validate_text_failure() {

        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_textView_fill_text_failure() {

        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .validate(value: "")
                .fill(with: "updateText")
                .validate(value: "XXX")
        }
    }

    func test_textView_clear_text_failure() {

        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .validate(value: "")
                .fill(with: "updateText")
                .validate(value: "updateText")
                .clearText()
                .validate(value: "XXX")
        }
    }

    func test_focus_text_view_failed() {

        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .focus()
            XCTAssert(self.app.keyboards.count == 0)
        }
    }



}
