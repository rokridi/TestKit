//
//  LBCSearchBarTester.swift
//  LBCTestKit
//
//  Created by Vincent DOUANT on 12/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

final class LBCSearchBarTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = Self.getSearchBar(with: identifier, in: context)
    }

    // MARK: - Utils (private)

    private static func getSearchBar(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let field = context.otherElements[identifier].firstMatch.searchFields.firstMatch
        XCTAssertTrue(field.waitForExistence(timeout: LBCTestTimeout.integration), "SearchBar with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return field
    }

    private func dimissQuickPathOnboardingIfExists() {// TODO : refactor this
        let view = self.context.otherElements["UIContinuousPathIntroductionView"]
        if view.exists {
            view.buttons["Continue"].tap()
        }
    }
}

// MARK: - LBCSearchBarTesterProtocol

extension LBCSearchBarTester: LBCSearchBarTesterProtocol {
    func focus() -> Self {
        let field = self.element
        field.tap()
        self.dimissQuickPathOnboardingIfExists()
        return self
    }

    func validate(value text: String) -> Self {
        do {
            let value: String = try XCTUnwrap(self.element.value as? String, "Failed to get searchBar String value".logTaggedWithEmoji())
            XCTAssertEqual(value, text, "SearchBar value \"\(value)\" does not equal to \"\(text)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap searchBar value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    func fill(with text: String) -> Self {
        let field = self.element
        field.tap()
        self.dimissQuickPathOnboardingIfExists()
        field.typeText(text)
        return self
    }

    func clearText() -> Self {
        let field = self.element
        if let stringValue = field.value as? String {
            field.tap()
            self.dimissQuickPathOnboardingIfExists()
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
            field.typeText(deleteString)
        }
        return self
    }
}
