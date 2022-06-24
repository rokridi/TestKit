//
//  LBCUIFailureNavigationBarButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureNavigationBarButtonTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithNavigationBar


    func test_get_navigationBarButton_WrongIdentifier() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester.getNavigationBarButton(with: "wrongIdentifier")
        }
    }

    func test_navigationBarButton_WrongTitle() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            self.tester.getNavigationBarButton(with: "barButtonItemIdentifier")
                .validate(value: "XXX")
        }
    }

    func test_navigationBarButton_tap_failure() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        XCTExpectFailure {
            let navigationBar = self.tester.getNavigationBar(with: "navigationBarIdentifier")
                .validate(title: "ABC")
            self.tester.getNavigationBarButton(with: "barButtonItemIdentifier")
                .validate(value: "action")
                .tap()
            navigationBar.validate(title: "ABC")
        }

    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
