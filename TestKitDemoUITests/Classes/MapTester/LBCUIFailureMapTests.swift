//
//  LBCUIFailureMapTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureMapTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithMap
        super.setUp()
    }

    func test_map_wrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getMap(with: "wrongIdentifier")
        }
    }

    func test_map_pinch_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let map = self.tester
                .getMap(with: "mapIdentifier")
            let label = self.tester.getLabel(with: "labelIdentifier")
            label.validate(value: "INITIAL REGION")
            map.pinch(withScale: 2, velocity: 2)
            sleep(2)
            label.validate(value: "INITIAL REGION")
        }
    }

    func test_map_double_tap_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let map = self.tester
                .getMap(with: "mapIdentifier")
            let label = self.tester.getLabel(with: "labelIdentifier")
            label.validate(value: "INITIAL REGION")
            map.doubleTap()
            sleep(2)
            label.validate(value: "INITIAL REGION")
        }
    }

    func test_map_swipe_action() {
        self.startApp()
        XCTExpectFailure {
            let map = self.tester
                .getMap(with: "mapIdentifier")
            let label = self.tester.getLabel(with: "labelIdentifier")
            label.validate(value: "INITIAL REGION")
            map.swipe(to: .left)
            sleep(2)
            label.validate(value: "INITIAL REGION")
        }
    }
}
