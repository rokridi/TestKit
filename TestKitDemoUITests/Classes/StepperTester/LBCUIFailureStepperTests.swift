//
//  LBCUIFailureStepperTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 02/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureStepperTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithStepper
        super.setUp()
        self.startApp(true)
    }

    func test_GetStepperElement_WrongIdentifier() {
        XCTExpectFailure {
            self.tester.getStepper(with: "wrongIdentifier")
        }
    }

    func test_Stepper_Wrong_Value() {
        XCTExpectFailure {
            self.tester
                .getStepper(with: "stepperIdentifier")
                .validate(value: 120.0, throughLabel: "stepperLabelidentifier")
        }
    }

    func test_Stepper_Wrong_WrongLabelIdentifier() {
        XCTExpectFailure {
            self.tester
                .getStepper(with: "stepperIdentifier")
                .validate(value: 80.0, throughLabel: "wrongStepperLabelIdentifier")
        }
    }

}
