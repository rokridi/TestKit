//
//  LBCTextViewTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 09/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCTextViewTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCTextViewTester.getTextView(with: identifier, in: context)
    }

    // MARK: - Utils (private)

    private static func getTextView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let field = context.textViews[identifier].firstMatch
        XCTAssertTrue(field.waitForExistence(timeout: LBCTestTimeout.integration), "TextView with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return field
    }

    private func dimissQuickPathOnboardingIfExists() {// TODO : refactor this
        let view = self.context.otherElements["UIContinuousPathIntroductionView"]
        if view.exists {
            view.buttons["Continue"].tap()
        }
    }
}

// MARK: - LBCTextViewTesterProtocol

extension LBCTextViewTester: LBCTextViewTesterProtocol {
    func focus() -> Self {
        let textView = self.element
        textView.tap()
        self.dimissQuickPathOnboardingIfExists()
        return self
    }

    func validate(value text: String) -> Self {
        do {
            let value: String = try XCTUnwrap(self.element.value as? String, "Failed to get texField String value".logTaggedWithEmoji())
            XCTAssertEqual(value, text, "TextView value \"\(value)\" does not equal to \"\(text)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap textView value. Error : \(error).".logTaggedWithEmoji())
        }
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

    func clearText() -> Self {
        let textView = self.element
        if let stringValue = textView.value as? String {
            textView.tap()
            self.dimissQuickPathOnboardingIfExists()
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
            textView.typeText(deleteString)
        }
        return self
    }
}
