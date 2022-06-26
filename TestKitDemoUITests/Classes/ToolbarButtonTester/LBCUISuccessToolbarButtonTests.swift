//
//  LBCUISuccessToolbarButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessToolbarButtonTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithToolbar
        super.setUp()
    }

    func test_ToolbarButton() {
        self.startApp(true)
        self.tester
            .getToolbarButton(with: "toolbarButtonIdentifier")
            .validate(value: "bouton")
            .tap()
            .validate(value: "pressed")
    }
}
