//
//  LBCActivityIndicatorTester.swift
//  LBCTestKit
//
//  Created by Poudja.canessane on 13/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

import XCTest

final class LBCActivityIndicatorTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCActivityIndicatorTester.getActivityIndicator(with: identifier, in: context)
    }

    private static func getActivityIndicator(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let activityIndicator = context.activityIndicators[identifier].firstMatch
        XCTAssertTrue(activityIndicator.waitForExistence(timeout: LBCTestTimeout.integration), "ActivityIndicator with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return activityIndicator
    }
}

extension LBCActivityIndicatorTester: LBCActivityIndicatorTesterProtocol {}
