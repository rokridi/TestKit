//
//  LBCUISuccessUIControlTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessUIControlTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithUIControl
        super.setUp()
        self.startApp(true)
    }

    func test_uicontrols() {
        self.tester.getView(with: "enableControldentifier")
            .validate(state: .enable)
            .validate(state: .unselected)
        self.tester.getView(with: "disableControldentifier")
            .validate(state: .disable)
            .validate(state: .unselected)
        self.tester.getView(with: "selectedControldentifier")
            .validate(state: .selected)
            .validate(state: .enable)
    }
}
