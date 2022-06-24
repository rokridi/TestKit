//
//  LBCUIFailureUIControlTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureUIControlTests: LBCUITestCase {

    func test_uicontrols_wrong_identifiers() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getView(with: "wrong_identifier")
        }
    }

    func test_uicontrol_enable_wrong_state() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getView(with: "enableControldentifier")
                .validate(state: .disable)
        }
    }

    func test_uicontrol_selected_wrong_state() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getView(with: "selectedControldentifier")
                .validate(state: .unselected)
        }
    }

    override func testingHomePageKey() -> String? {
        return HomePageType.homePageWithUIControl.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
