//
//  LBCUISuccessToolbarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessToolbarTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithToolbar
        super.setUp()
    }

    func test_Toolbar() {
        self.startApp()
        self.tester
            .getToolbar(with: "toolbarIdentifier")
    }
}
