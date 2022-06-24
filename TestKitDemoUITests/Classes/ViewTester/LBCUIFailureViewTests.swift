//
//  LBCUIFailureViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithView
        super.setUp()
    }

    func test_stackView_content_wrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getView(with: "stackViewIdentifier")
                .content
                .getLabel(with: "wrongSubLabelIdentifier")
        }
    }

    func testGetView_WrongIdentifier() {
        self.startApp()
        XCTExpectFailure {
            self.tester.getView(with: "wrongIdentifier")
        }
    }

    func test_view_tap_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").tap()
            label.validate(value: "Double Tap Action")
        }
    }

    func test_view_double_tap_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").doubleTap()
            usleep(100000)
            label.validate(value: "Simple Tap Action")
        }
    }

    func test_view_tap_two_finger_action() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").twoFingerTap()
            label.validate(value: "Tap Action with 1 number of touches")
        }
    }

    func test_view_tap_multiple_touches_action() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").tap(withNumberOfTaps: 1, numberOfTouches: 3)
            label.validate(value: "Tap Action with 2 number of touches")
        }
    }

    func test_view_long_press_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").press(forDuration: 2)
            label.validate(value: "Simple Ta pAction")
        }
    }

    func test_view_swipeUp_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").swipe(to: .up)
            label.validate(value: "Swipe Down Action")
        }
    }

    func test_view_swipeDown_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").swipe(to: .down)
            label.validate(value: "Swipe Up Action")
        }
    }

    func test_view_swipeLeft_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").swipe(to: .left)
            label.validate(value: "Swipe Right Action")
        }
    }

    func test_view_swipeRight_action_failure() {
        self.startApp()
        XCTExpectFailure {
            let label = self.tester.getLabel(with: "labelIdentifier")
            self.tester.getView(with: "viewIdentifier").swipe(to: .right)
            label.validate(value: "Swipe Left Action")
        }
    }


}
