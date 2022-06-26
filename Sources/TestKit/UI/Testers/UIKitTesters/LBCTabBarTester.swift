//
//  LBCTabBarTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCTabBarTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCTabBarTester.getTabBar(with: identifier, in: context)
    }

    private static func getTabBar(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let tabBar = context.tabBars[identifier].firstMatch
        XCTAssertTrue(tabBar.waitForExistence(timeout: LBCTestTimeout.integration), "TabBar with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return tabBar
    }
}

extension LBCTabBarTester: LBCTabBarTesterProtocol {}
