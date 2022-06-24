//
//  LBCUIFailureSecuredTextFieldTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Pierre A on 11/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureSecuredTextFieldTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithSecuredTextField

    func test_SecuredTextField_wrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getSecuredTextField(with: "wrongIdentifier")
        }

    }

    func test_SecuredTextField_wrongGetter() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTextField(with: "textFieldIdentifier")
        }

    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
