//
//  LBCActionSheetTester.swift
//  LBCTestKit
//
//  Created by Jean Di Giovanni on 28/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

public enum LBCActionSheetElementType {
    case title(String)
    case message(String)
    case button(String)
}

final class LBCActionSheetTester {
    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCActionSheetTester.getActionSheet(with: identifier, in: context)
    }

    private static func getActionSheet(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let actionSheet = context.sheets[identifier].firstMatch
        XCTAssertTrue(actionSheet.waitForExistence(timeout: LBCTestTimeout.integration), "Action sheet with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return actionSheet
    }
}

extension LBCActionSheetTester: LBCActionSheetTesterProtocol {
    @discardableResult
    func validate(element: LBCActionSheetElementType) -> Self {
        let actionSheet = self.element

        switch element {
        case .title(let title):
            XCTAssertEqual(actionSheet.label, title, "Action sheet - wrong expected title value".logTaggedWithEmoji())
        case .message(let message):
            XCTAssertTrue(actionSheet.staticTexts[message].exists, "Action sheet - the expected value does not exist".logTaggedWithEmoji())
        case .button(let label):
            XCTAssertTrue(actionSheet.buttons[label].exists, "Action sheet - the expected button does not exist".logTaggedWithEmoji())
        }

        return self
    }

    @discardableResult
    func tapOnAction(withLabel label: String) -> Self {
        let actionSheet = self.element
        let action = actionSheet.buttons[label].firstMatch
        action.tap()
        return self
    }
}
