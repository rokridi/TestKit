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

    override func setUp() {
        self.homePageType = .homePageWithSearchBar
        super.setUp()
        self.startApp(true)
    }

    func test_SearchTextField() {
        self.tester
            .getSearchBar(with: "searchBarIdentifier")
            .fill(with: "updateText")
            .validate(value: "updateText")
            .clearText()
            .validate(value: "")
    }
}
