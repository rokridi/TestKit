//
//  LBCUIFailureAlertTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureAlertTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithAlert
        super.setUp()
    }

    func test_GetAlert_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getAlert(with: "wrongIdentifier")
        }
    }

    func test_Alert_WrongTitle() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getAlert(with: "alertIdentifier")
                .validate(element: .title("wrongTitle"))
        }
    }

    func test_Alert_WrongMessage() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getAlert(with: "alertIdentifier")
                .validate(element: .message("wrongMessage"))
        }

    }

    func test_Alert_TapOnAction_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getAlert(with: "alertIdentifier")
                .tapOnAction(withLabel: "wrongLabel")
        }

    }
}
