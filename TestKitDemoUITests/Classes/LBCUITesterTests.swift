//
//  LBCUITesterTests.swift
//  LBCTestKitTests
//
//  Created by Jean di Giovanni on 23/12/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
import TestKit

final class LBCUITesterTests: XCTestCase {
    func testWait_ShouldFulfillExpectation_GivenExpectationTimeOutIsSuperiorToWaitTimeInterval() {
        // GIVEN
        let application = XCUIApplication()
        let tester = LBCUITester(context: application)
        let waitExpectation = self.expectation(description: "tester should succeed to wait for 1.5 seconds")

        // WHEN
        DispatchQueue.main.async {
            tester.wait(for: 1.5, message: "tester should wait for 1.5 seconds")
            waitExpectation.fulfill()
        }

        // THEN
        self.wait(for: [waitExpectation], timeout: 2.0)
    }

    func testWait_ShouldNotFulfillExpectation_GivenExpectationTimeOutIsInferiorToWaitTimeInterval() {
        // GIVEN
        let application = XCUIApplication()
        let tester = LBCUITester(context: application)
        let waitExpectation = self.expectation(description: "tester should not succeed to wait for 1.5 seconds")
        waitExpectation.isInverted = true

        // WHEN
        DispatchQueue.main.async {
            XCTExpectFailure {
                tester.wait(for: 1.5, message: "tester should wait for 1.5 seconds")
            }
            waitExpectation.fulfill()
        }

        // THEN
        self.wait(for: [waitExpectation], timeout: 1.0)
    }
}
