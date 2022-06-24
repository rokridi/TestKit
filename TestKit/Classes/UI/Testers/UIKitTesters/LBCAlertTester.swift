//
//  LBCAlertTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

public enum LBCAlertElementType {
    case title(String)
    case message(String)
}

final class LBCAlertTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {// todo rm id ?
        self.context = context
        self.element = LBCAlertTester.getAlert(with: identifier, in: context)
    }

    private static func getAlert(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let alert = context.alerts[identifier].firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: LBCTestTimeout.integration), "Alert with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return alert
    }
}

extension LBCAlertTester: LBCAlertTesterProtocol {
    @discardableResult
    func validate(element: LBCAlertElementType) -> Self {
        let alert = self.element
        switch element {
        case .title(let title):
            XCTAssertEqual(alert.label, title, "Alert - wrong expected title value".logTaggedWithEmoji())
        case .message(let message):
            XCTAssertTrue(alert.staticTexts[message].exists, "Alert - the expected value does not exist".logTaggedWithEmoji())
        }

        return self
    }

    @discardableResult
    func tapOnAction(withLabel label: String) -> Self {
        let alert = self.element
        let action = alert.buttons[label].firstMatch
        action.tap()
        return self
    }
}
