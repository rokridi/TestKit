//
//  LBCButtonTester.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 28/08/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCButtonTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCButtonTester.getButton(with: identifier, in: context)
    }

    // MARK: - Utils

    private static func getButton(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let button = context.buttons[identifier].firstMatch
        XCTAssertTrue(button.waitForExistence(timeout: LBCTestTimeout.integration), "Button with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return button
    }
}

// MARK: - LBCButtonTesterProtocol

extension LBCButtonTester: LBCButtonTesterProtocol {
    func validate(isEnabled value: Bool) -> Self {
        let button = self.element
        XCTAssertEqual(button.isEnabled, value, "Button with identifier \(button.identifier) enable state \(button.isEnabled) is not equal to \(value)".logTaggedWithEmoji())
        return self
    }

    func validate(value text: String) -> Self {
        let button = self.element
        XCTAssertEqual(button.label, text, "Button's label \"\(button.label)\" is not equal to \"\(text)\"".logTaggedWithEmoji())
        return self
    }

    func tap() -> Self {
        let button = self.element
        button.tap()
        return self
    }
}
