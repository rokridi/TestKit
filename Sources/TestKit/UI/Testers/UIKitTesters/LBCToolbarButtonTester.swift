//
//  LBCToolbarButtonTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCToolbarButtonTester {
    private let context: XCUIElement
    var element: XCUIElement
    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCToolbarButtonTester.getToolbarButton(with: identifier, in: context)
    }

    private static func getToolbarButton(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let toolbarButton = context.buttons[identifier].firstMatch
        XCTAssertTrue(toolbarButton.waitForExistence(timeout: LBCTestTimeout.integration), "ToolbarButton with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return toolbarButton
    }
}

extension LBCToolbarButtonTester: LBCToolbarButtonTesterProtocol {
    func validate(value text: String) -> Self {
        let toolbarButton = self.element
        XCTAssertEqual(toolbarButton.label, text, "ToolbarButton label \"\(toolbarButton.label)\" is not equal to \"\(text)\"".logTaggedWithEmoji())
        return self
    }

    func tap() -> Self {
        let barButtonItem = self.element
        barButtonItem.tap()
        return self
    }
}
