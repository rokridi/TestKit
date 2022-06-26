//
//  LBCLinkTester.swift
//  LBCTestKit
//
//  Created by Jean Di Giovanni on 12/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

final class LBCLinkTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCLinkTester.getLink(with: identifier, in: context)
    }

    private static func getLink(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let link = context.links[identifier].firstMatch
        XCTAssertTrue(link.waitForExistence(timeout: LBCTestTimeout.integration), "Link with identifier \"\(identifier)\" does not exit.".logTaggedWithEmoji())
        return link
    }
}

extension LBCLinkTester: LBCLinkTesterProtocol {
    func tap(position: LBCUIElementTapPosition) -> Self {
        let view = self.element
        view.tap(position: position)
        return self
    }

    func validate(label text: String) -> Self {
        let label: String = self.element.label
        XCTAssertEqual(label, text, "Link label \"\(label)\" is not equal to \(text).".logTaggedWithEmoji())
        return self
    }
}
