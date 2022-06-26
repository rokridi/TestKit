//
//  LBCProgressIndicatorTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCProgressIndicatorTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCProgressIndicatorTester.getProgressIndicator(with: identifier, in: context)
    }

    private static func getProgressIndicator(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let progressIndicator = context.progressIndicators[identifier].firstMatch
        XCTAssertTrue(progressIndicator.waitForExistence(timeout: LBCTestTimeout.integration), "ProgressIndicator with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return progressIndicator
    }
}

extension LBCProgressIndicatorTester: LBCProgressIndicatorTesterProtocol {
    func validate(progressValue value: Float) -> Self {
        let progressIndicator = self.element
        do {
            let progessValue: String = try XCTUnwrap(progressIndicator.value as? String, "Failed to get ProgressIndicator String value".logTaggedWithEmoji()) // "50%"
            let progressCleanValue = String(progessValue.dropLast()) // "50"
            let percentValue: Float = try XCTUnwrap(Float(progressCleanValue), "Failed to cast ProgressIndicator String value to Float".logTaggedWithEmoji()) / 100 // 0.5
            XCTAssertEqual(percentValue, value, "ProgressIndicator value \"\(percentValue)\" does not equal to \"\(value)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap ProgressIndicator value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }
}
