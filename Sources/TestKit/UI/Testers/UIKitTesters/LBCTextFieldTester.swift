//
//  LBCTextFieldTester.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCTextFieldTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCTextFieldTester.getTextField(with: identifier, in: context)
    }

    // MARK: - Utils

    private static func getTextField(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let field = context.textFields[identifier].firstMatch
        XCTAssertTrue(field.waitForExistence(timeout: LBCTestTimeout.integration), "TextField with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
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

extension LBCTextFieldTester: LBCTextFieldTesterProtocol {
    func focus() -> Self {
        let textField = self.element
        textField.tap()
        self.dimissQuickPathOnboardingIfExists()
        return self
    }

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

    func validate(value text: String) -> Self {
        do {
            let value: String = try XCTUnwrap(self.element.value as? String, "Failed to get texField String value".logTaggedWithEmoji())
            XCTAssertEqual(value, text, "Textfield value \"\(value)\" does not equal to \"\(text)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap textField value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    func validate(placeholder text: String) -> Self {
        do {
            let placeholderValue: String = try XCTUnwrap(self.element.placeholderValue, "Failed to get texField placeholderValue".logTaggedWithEmoji())
            XCTAssertEqual(placeholderValue, text, "Textfield placeholder \"\(placeholderValue)\" does not equal to \"\(text)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap textField placeholderValue. Error : \(error).".logTaggedWithEmoji())
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

    func validateFormat(with regex: String) -> Self {
        do {
            let value: String = try XCTUnwrap(self.element.value as? String, "Failed to get texField String value".logTaggedWithEmoji())
            XCTAssertTrue(value.validateRegexPattern(from: regex), "Textfield value \"\(value)\" does not match to regex format \"\(regex)\".".logTaggedWithEmoji())

        } catch let error {
            XCTFail("Failed to unwrap textField value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }
}
