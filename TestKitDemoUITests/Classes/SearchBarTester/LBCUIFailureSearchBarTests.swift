//
//  LBCUIFailureSearchBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Vincent DOUANT on 12/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureSearchBarTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithSearchBar

    func test_SearchTextField_wrongIdentifier() {
        self.startApp()
        _ = XCTExpectFailure {
            self.tester
                .getSearchBar(with: "wrongIdentifier")
        }
    }

    func test_SearchTextField_wrongGetter() {
        self.startApp()
        _ = XCTExpectFailure {
            self.tester
                .getTextField(with: "searchBarIdentifier")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
