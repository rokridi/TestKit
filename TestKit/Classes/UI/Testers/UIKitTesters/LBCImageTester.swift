//
//  LBCImageTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCImageTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCImageTester.getImage(with: identifier, in: context)
    }

    private static func getImage(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let image = context.images[identifier].firstMatch
        XCTAssertTrue(image.waitForExistence(timeout: LBCTestTimeout.integration), "Image with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return image
    }
}

extension LBCImageTester: LBCImageTesterProtocol {

}
