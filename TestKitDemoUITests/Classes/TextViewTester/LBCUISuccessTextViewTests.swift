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
    private var homePageType: HomePageType = .homePageWithTextView

    func testTextView() {
        self.startApp()
        self.tester
            .getTextView(with: "textViewIdentifier")
            .validate(value: "")
            .fill(with: "updateText")
            .validate(value: "updateText")
            .clearText()
            .validate(value: "")
    }

    func test_focus_text_view() {
        self.startApp()
        XCTAssert(self.app.keyboards.count == 0)
        self.tester
            .getTextView(with: "textViewIdentifier")
            .focus()
        XCTAssert(self.app.keyboards.count > 0)
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
