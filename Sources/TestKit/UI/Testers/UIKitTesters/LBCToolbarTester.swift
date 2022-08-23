//
//  LBCToolbarTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCToolbarTester {
    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCToolbarTester.getToolbar(with: identifier, in: context)
    }

    private static func getToolbar(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let toolbar = context.toolbars[identifier].firstMatch
        XCTAssertTrue(toolbar.waitForExistence(timeout: LBCTestTimeout.integration), "Toolbar with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return toolbar
    }
}

extension LBCToolbarTester: LBCToolbarTesterProtocol {}
