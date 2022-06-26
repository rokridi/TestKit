//
//  LBCUISuccessTextViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessTextViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTextView
        super.setUp()
        self.startApp(true)
    }

    func testTextView() {
        self.tester
            .getTextView(with: "textViewIdentifier")
            .validate(value: "")
            .fill(with: "updateText")
            .validate(value: "updateText")
            .clearText()
            .validate(value: "")
    }

    func test_focus_text_view() {
        XCTAssert(self.app.keyboards.count == 0)
        self.tester
            .getTextView(with: "textViewIdentifier")
            .focus()
        XCTAssert(self.app.keyboards.count > 0)
    }
}
