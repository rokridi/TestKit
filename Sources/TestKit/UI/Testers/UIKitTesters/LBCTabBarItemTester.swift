//
//  LBCTabBarItemTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 01/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit
import XCTest

final class LBCTabBarItemTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCTabBarItemTester.getTabBarItem(with: identifier, in: context)
    }

    private static func getTabBarItem(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let tabBarItem = context.buttons[identifier].firstMatch
        XCTAssertTrue(tabBarItem.waitForExistence(timeout: LBCTestTimeout.integration), "TabBarItem with identifier \"\(tabBarItem)\" does not exist.".logTaggedWithEmoji())
        return tabBarItem
    }
}

extension LBCTabBarItemTester: LBCTabBarItemTesterProtocol {
    func tap() -> Self {
        let tabBarItem = self.element
        tabBarItem.tap()
        return self
    }


    func validateState(isSelected state: Bool) -> Self {
        let tabBarItem = self.element
        XCTAssertEqual(tabBarItem.isSelected, state, "TabBarItem with identifier \"\(tabBarItem)\" does not have required state \(state)".logTaggedWithEmoji())
        return self
    }

    func validateText(value text: String) -> Self {
        let tabBarItem = self.element
        XCTAssertEqual(tabBarItem.label, text, "TabBarItem label \"\(tabBarItem.label)\" is not equal to \"\(text)\"".logTaggedWithEmoji())
        return self
    }
}
