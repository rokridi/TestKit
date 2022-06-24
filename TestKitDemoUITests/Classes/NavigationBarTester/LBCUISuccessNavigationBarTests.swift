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
    private var homePageType: HomePageType = .homePageWithNavigationBar

    func testGetNavigationBar() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        self.tester.getNavigationBar(with: "navigationBarIdentifier")
            .validate(title: "ABC")
    }

    func testGetNavigationBar_ChildContentButton() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp()

        // THEN
        self.tester
            .getNavigationBar(with: "navigationBarIdentifier")
            .content
            .getNavigationBarButton(with: "navigationBarButtonIdentifier")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
