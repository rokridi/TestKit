//
//  LBCUISuccessNavigationBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessNavigationBarTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithNavigationBar
        super.setUp()
    }

    func testGetNavigationBar() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // THEN
        self.tester.getNavigationBar(with: "navigationBarIdentifier")
            .validate(title: "ABC")
    }

    func testGetNavigationBar_ChildContentButton() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // THEN
        self.tester
            .getNavigationBar(with: "navigationBarIdentifier")
            .content
            .getNavigationBarButton(with: "navigationBarButtonIdentifier")
    }
}
