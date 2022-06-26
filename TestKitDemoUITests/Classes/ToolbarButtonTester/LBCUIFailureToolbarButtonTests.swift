//
//  LBCUIFailureToolbarButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureToolbarButtonTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithToolbar
        super.setUp()
        self.startApp(true)
    }

    func test_ToolbarButton_WrongIdentifier() {

        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "wrongIdentifier")
        }
    }

    func test_ToolbarButton_WrongTitle() {

        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "toolbarButtonIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_ToolbarButton_TapFailure() {

        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "toolbarButtonIdentifier")
                .validate(value: "bouton")
                .tap()
                .validate(value: "XXX")
        }
    }
}
