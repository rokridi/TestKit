//
//  LBCUISuccessSearchBarTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Vincent DOUANT on 12/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//


import XCTest
@testable import TestKit

final class LBCUISuccessSearchBarTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithSearchBar

    func test_SearchTextField() {
        self.startApp()
        self.tester
            .getSearchBar(with: "searchBarIdentifier")
            .fill(with: "updateText")
            .validate(value: "updateText")
            .clearText()
            .validate(value: "")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
