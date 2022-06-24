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

    private var homePageType: HomePageType = .homePageWithToolbar

    func test_ToolbarButton() {
        self.startApp()
        self.tester
            .getToolbarButton(with: "toolbarButtonIdentifier")
            .validate(value: "bouton")
            .tap()
            .validate(value: "pressed")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
