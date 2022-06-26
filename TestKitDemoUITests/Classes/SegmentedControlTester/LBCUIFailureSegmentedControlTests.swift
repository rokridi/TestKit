//
//  LBCUIFailureSegmentedControlTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureSegmentedControlTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSegmentedControl
        super.setUp()
    }

    func test_GetSegmentedControlElement_WrongIdenfitier() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getSegmentedControl(with: "wrongIdentifier")
        }
    }

    func test_SegmentedControl_WrongTextValue_AtIndex() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSegmentedControl(with: "segmentedControlIdentifier")
                .validate(textValue: "Third", at: 0)
        }
    }

    func test_SegmentedControl_WrongSelectionState_AtIndex() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSegmentedControl(with: "segmentedControlIdentifier")
                .validate(selectionState: true, at: 1)
        }
    }

    func test_SegmentedControl_WrongTextValue_AtIndex_And_WrongSelectionState_AtIndex() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSegmentedControl(with: "segmentedControlIdentifier")
                .validate(textValue: "First", at: 1)
                .validate(selectionState: true, at: 1)
        }
    }
}
