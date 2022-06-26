//
//  LBCNavigationBarTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCNavigationBarTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCNavigationBarTester.getNavigationBar(with: identifier, in: context)
    }

    private static func getNavigationBar(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let navigationBar = context.navigationBars[identifier].firstMatch
        XCTAssertTrue(navigationBar.waitForExistence(timeout: LBCTestTimeout.integration), "NavigationBar with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return navigationBar
    }
}

extension LBCNavigationBarTester: LBCNavigationBarTesterProtocol {
    func validate(title text: String) -> LBCNavigationBarTesterProtocol {
        let navigationBar = self.element
        let navBarTitle = navigationBar.staticTexts.firstMatch
        XCTAssertEqual(navBarTitle.label, text, "NavigationBar title \"\(navBarTitle.label)\" does not equal to \"\(text)\".".logTaggedWithEmoji())
        return self
    }
}
