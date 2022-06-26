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
    }

    func test_ToolbarButton_WrongIdentifier() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "wrongIdentifier")
        }
    }

    func test_ToolbarButton_WrongTitle() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "toolbarButtonIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_ToolbarButton_TapFailure() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getToolbarButton(with: "toolbarButtonIdentifier")
                .validate(value: "bouton")
                .tap()
                .validate(value: "XXX")
        }
    }
}
