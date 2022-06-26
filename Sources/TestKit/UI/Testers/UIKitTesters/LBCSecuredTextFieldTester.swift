//
//  LBCSecuredTextFieldTester.swift
//  LBCTestKit
//
//  Created by Pierre A on 11/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

final class LBCSecuredTextFieldTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCSecuredTextFieldTester.getSecuredTextField(with: identifier, in: context)
    }

    // MARK: - Utils

    private static func getSecuredTextField(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let field = context.secureTextFields[identifier].firstMatch
        XCTAssertTrue(field.waitForExistence(timeout: LBCTestTimeout.integration), "Secured TextField with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return field
    }

    private func dimissQuickPathOnboardingIfExists() {
        let view = self.context.otherElements["UIContinuousPathIntroductionView"]
        if view.exists {
            view.buttons["Continue"].tap()
        }
    }
}

// MARK: - LBCTextFieldTesterProtocol

extension LBCSecuredTextFieldTester: LBCSecuredTextFieldTesterProtocol {

    func fill(with text: String) -> Self {
        let textField = self.element
        textField.tap()
        self.dimissQuickPathOnboardingIfExists()
        textField.typeText(text)
        if self.element.keys.element(boundBy: 0).exists {
            self.element.typeText("\n")
        }
        return self
    }

    func clearText() -> Self {
        let textField = self.element
        if let stringValue = textField.value as? String {
            textField.tap()
            self.dimissQuickPathOnboardingIfExists()
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
            textField.typeText(deleteString)
        }
        return self
    }
}
