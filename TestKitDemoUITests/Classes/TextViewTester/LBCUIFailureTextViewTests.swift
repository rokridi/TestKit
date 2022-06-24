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
    private var homePageType: HomePageType = .homePageWithTextView

    func test_textView_wrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextView(with: "wrongIdentifier")
        }
    }

    func test_textView_validate_text_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_textView_fill_text_failure() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .validate(value: "")
                .fill(with: "updateText")
                .validate(value: "XXX")
        }
    }

    func test_textView_clear_text_failure() {
        self.startApp()
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
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextView(with: "textViewIdentifier")
                .focus()
            XCTAssert(self.app.keyboards.count == 0)
        }
    }


    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
