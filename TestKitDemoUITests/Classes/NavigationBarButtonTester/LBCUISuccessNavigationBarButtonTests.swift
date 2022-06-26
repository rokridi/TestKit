//
//  LBCUISuccessNavigationBarButtonTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 15/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessNavigationBarButtonTests: LBCUITestCase {
    override func setUp() {
        self.homePageType = .homePageWithNavigationBar
        super.setUp()
    }

    func testNavigationBarButton() {
        // GIVEN
        self.homePageType = .homePageWithNavigationBar

        // WHEN
        self.startApp(true)

        // THEN
        let navigationBar = self.tester.getNavigationBar(with: "navigationBarIdentifier")
            .validate(title: "ABC")
        self.tester.getNavigationBarButton(with: "barButtonItemIdentifier")
            .validate(value: "action")
            .tap()
        navigationBar.validate(title: "PRESSED")
    }
}
