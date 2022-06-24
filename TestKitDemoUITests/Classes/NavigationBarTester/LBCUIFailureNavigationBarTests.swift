//
//  LBCUIFailureNavigationBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureNavigationBarTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithNavigationBar
        super.setUp()
    }

    func testGetWrongNavigationBar() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "wrongIdentifier")
        }
    }

    func testGetWrongNavigationBarTitle() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "navigationBarIdentifier").validate(title: "XXX")
        }
    }

    func testGetNavigationBar_ChildContentWrongButton() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        _ = XCTExpectFailure {
            self.tester
                .getNavigationBar(with: "navigationBarIdentifier")
                .content
                .getNavigationBarButton(with: "navigationBarButtonBadIdentifier")
        }
    }


}
