//
//  LBCUISuccessStepperTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessStepperTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithStepper
        super.setUp()
    }

    func test_Stepper_Increment_And_ValidateValue() {
        self.startApp()
        self.tester
            .getStepper(with: "stepperIdentifier")
            .validate(value: 10.0, throughLabel: "stepperLabelIdentifier")
            .increment()
            .validate(value: 11.0, throughLabel: "stepperLabelIdentifier")
    }

    func test_Stepper_Decrement_And_ValidateValue() {
        self.startApp()
        self.tester
            .getStepper(with: "stepperIdentifier")
            .validate(value: 10.0, throughLabel: "stepperLabelIdentifier")
            .decrement()
            .validate(value: 9.0, throughLabel: "stepperLabelIdentifier")
    }
}
