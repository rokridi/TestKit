//
//  LBCSwitchTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCSwitchTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCSwitchTester.getSwitch(with: identifier, in: context)
    }

    private static func getSwitch(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let switchView = context.switches[identifier].firstMatch
        XCTAssertTrue(switchView.waitForExistence(timeout: LBCTestTimeout.integration), "Switch with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return switchView
    }
}

extension LBCSwitchTester: LBCSwitchTesterProtocol {
    func validate(state isOn: Bool) -> Self {
        do {
            let switchValue: String = try XCTUnwrap(self.element.value as? String, "Failed do get switch string value".logTaggedWithEmoji())
            let expectedValue: String = isOn ? "1" : "0"
            XCTAssertEqual(switchValue, expectedValue, "Switch state \"\(switchValue)\" does not equal to \"\(expectedValue)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap switch value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    func toggle() -> Self {
        let switchElement = self.element
        switchElement.tap()
        return self
    }
}
