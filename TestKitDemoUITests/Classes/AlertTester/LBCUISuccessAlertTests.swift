//
//  LBCUISuccessAlertTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessAlertTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithAlert
        super.setUp()
    }

    func test_Alert_TapOnAction1() {
        self.startApp()
        self.tester
            .getAlert(with: "alertIdentifier")
            .validate(element: .title("Title ABC"))
            .validate(element: .message("message CBA"))
            .tapOnAction(withLabel: "Action 1")
    }

    func test_Alert_TapOnAction2() {
        self.startApp()
        self.tester
            .getAlert(with: "alertIdentifier")
            .validate(element: .title("Title ABC"))
            .validate(element: .message("message CBA"))
            .tapOnAction(withLabel: "Action 2")
    }
}
