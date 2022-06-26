//
//  LBCScrollBarTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCScrollBarTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCScrollBarTester.getScrollBar(with: identifier, in: context)
    }

    private static func getScrollBar(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let scrollBar = context.scrollBars[identifier].firstMatch
        XCTAssertTrue(scrollBar.waitForExistence(timeout: LBCTestTimeout.integration), "ScrollBar with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return scrollBar
    }
}

extension LBCScrollBarTester: LBCScrollBarTesterProtocol {

}
