//
//  LBCTestTimeoutTests.swift
//  LBCTestKitTests
//
//  Created by Pierre Abi-aad on 12/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

@testable import TestKit
import XCTest

final class LBCTestTimeoutTests: XCTestCase {
    func test_values() {
        // GIVEN
        let valuesAndExpectations: [TimeInterval: TimeInterval] = [
            LBCTestTimeout.short: 0.1,
            LBCTestTimeout.normal: 0.2,
            LBCTestTimeout.long: 0.4,
            LBCTestTimeout.integration: 3
        ]

        // WHEN...THEN
        valuesAndExpectations.forEach {
            XCTAssertEqual($0.key, $0.value)
        }
    }
}
