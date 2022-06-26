//
//  LBCBarButtonItemTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit
import XCTest

final class LBCNavigationBarButtonTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCNavigationBarButtonTester.getBarButtonItem(with: identifier, in: context)
    }

    private static func getBarButtonItem(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let navigationBarButton = context.buttons[identifier].firstMatch
        XCTAssertTrue(navigationBarButton.waitForExistence(timeout: LBCTestTimeout.integration), "NavigationBarButton with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return navigationBarButton
    }
}

extension LBCNavigationBarButtonTester: LBCNavigationBarButtonTesterProtocol {
    func validate(value text: String) -> Self {
        let navigationBarButton = self.element
        XCTAssertEqual(navigationBarButton.label, text, "NavigationBarButton label \"\(navigationBarButton.label)\" is not equal to \"\(text)\"".logTaggedWithEmoji())
        return self
    }

    func tap() -> Self {
        let navigationBarButton = self.element
        navigationBarButton.tap()
        return self
    }
}
