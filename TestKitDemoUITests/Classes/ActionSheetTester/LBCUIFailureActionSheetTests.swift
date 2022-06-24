//
//  LBCUIFailureActionSheetTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Jean Di Giovanni on 28/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureActionSheetTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithActionSheet
        super.setUp()
    }

    func test_GetActionSheet_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getActionSheet(with: "wrongIdentifier")
        }
    }

    func test_GetActionSheet_WrongTitle() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getActionSheet(with: "actionSheetIdentifier")
                .validate(element: .title("wrongTitle"))
        }
    }

    func test_GetActionSheet_WrongMessage() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getActionSheet(with: "actionSheetIdentifier")
                .validate(element: .message("wrongMessage"))
        }
    }

    func test_GetActionSheet_WrongButton() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getActionSheet(with: "actionSheetIdentifier")
                .validate(element: .button("wrongButton"))
        }
    }

    func test_GetActionSheet_TapOnAction_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getActionSheet(with: "wrongIdentifier")
                .tapOnAction(withLabel: "wrongLabel")
        }
    }
}
