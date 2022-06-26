//
//  LBCLabelTester.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 21/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCLabelTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCLabelTester.getLabel(with: identifier, in: context)
    }

    // MARK: - Utils

    private static func getLabel(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let label = context.staticTexts[identifier].firstMatch
        XCTAssertTrue(label.waitForExistence(timeout: LBCTestTimeout.integration), "Label with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return label
    }
}

// MARK: - LBCLabelTesterProtocol

extension LBCLabelTester: LBCLabelTesterProtocol {

    func validate(value text: String) -> Self {
        let value: String = self.element.label
        XCTAssertEqual(value, text, "Label value \"\(value)\" is not equal to \(text).".logTaggedWithEmoji())
        return self
    }
}
