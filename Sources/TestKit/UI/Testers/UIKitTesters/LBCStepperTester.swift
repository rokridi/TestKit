//
//  LBCStepperTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCStepperTester {

    private let context: XCUIElement
    var element: XCUIElement
    private var stepperValue: Double = 0.0

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCStepperTester.getStepper(with: identifier, in: context)
    }

    private static func getStepper(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let stepper = context.steppers[identifier].firstMatch
        XCTAssertTrue(stepper.waitForExistence(timeout: LBCTestTimeout.integration), "Stepper with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return stepper
    }
}

extension LBCStepperTester: LBCStepperTesterProtocol {
    @discardableResult
    func validate(value: Double, throughLabel labelIdentifier: LBCUIElementIdentifier) -> Self {
        do {
            let label = self.context.staticTexts[labelIdentifier].firstMatch
            let labelDouble = try XCTUnwrap(Double(label.label), "Stepper - failed to unwrap label value".logTaggedWithEmoji())
            XCTAssertEqual(value, labelDouble, "Stepper - wrong expected value".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Stepper - failed to unwrap label value. Error: \(error)".logTaggedWithEmoji())
        }
        return self
    }

    @discardableResult
    func increment() -> Self {
        let stepper = self.element
        stepper.buttons["Increment"].tap()
        return self
    }

    @discardableResult
    func decrement() -> Self {
        let stepper = self.element
        stepper.buttons["Decrement"].tap()
        return self
    }
}
