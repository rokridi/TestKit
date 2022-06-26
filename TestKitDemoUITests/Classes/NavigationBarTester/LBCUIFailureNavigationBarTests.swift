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
        self.startApp()
    }

    func testGetWrongNavigationBar() {
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "wrongIdentifier")
        }
    }

    func testGetWrongNavigationBarTitle() {
        _ = XCTExpectFailure {
            self.tester.getNavigationBar(with: "navigationBarIdentifier").validate(title: "XXX")
        }
    }

    func testGetNavigationBar_ChildContentWrongButton() {
        _ = XCTExpectFailure {
            self.tester
                .getNavigationBar(with: "navigationBarIdentifier")
                .content
                .getNavigationBarButton(with: "navigationBarButtonBadIdentifier")
        }
    }
}
