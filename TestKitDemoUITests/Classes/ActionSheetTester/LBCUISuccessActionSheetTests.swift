//
//  LBCUISuccessActionSheetTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Jean Di Giovanni on 28/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessActionSheetTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithActionSheet
        super.setUp()
        self.startApp()
    }

    func test_ActionSheet_AssertButtons() {
        self.tester
            .getActionSheet(with: "actionSheetIdentifier")
            .validate(element: .button("Action 1"))
            .validate(element: .button("Action 2"))
    }

    func test_ActionSheet_TapOnAction1() {
        self.tester
            .getActionSheet(with: "actionSheetIdentifier")
            .validate(element: .title("Title ABC"))
            .validate(element: .message("message CBA"))
            .tapOnAction(withLabel: "Action 1")
    }

    func test_ActionSheet_TapOnAction2() {
        self.tester
            .getActionSheet(with: "actionSheetIdentifier")
            .validate(element: .title("Title ABC"))
            .validate(element: .message("message CBA"))
            .tapOnAction(withLabel: "Action 2")
    }
}
