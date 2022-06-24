//
//  LBCUISuccessViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessViewTests: LBCUITestCase {
    private var homePageType: HomePageType = .homePageWithView

    func test_stackView_content() {
        self.startApp()
        let stackviewContent = self.tester
            .getView(with: "stackViewIdentifier")
            .content

        stackviewContent.getView(with: "viewIdentifier")
        stackviewContent.getLabel(with: "subLabelIdentifier")
    }

    func test_view_tap_actions() {
        self.startApp()
        let label = self.tester.getLabel(with: "labelIdentifier")
        let view = self.tester.getView(with: "viewIdentifier")

        view.tap()
        label.validate(value: "Simple Tap Action")

        view.press(forDuration: 2)
        label.validate(value: "Long Press Action")
    }

    func test_view_tap_multiple_touches_action() {
        self.startApp()
        let label = self.tester.getLabel(with: "labelIdentifier")
        let view = self.tester.getView(with: "viewIdentifier")

        view.doubleTap()
        usleep(100000)
        label.validate(value: "Double Tap Action")

        view.twoFingerTap()
        label.validate(value: "Tap Action with 2 number of touches")

        view.tap(withNumberOfTaps: 1, numberOfTouches: 3)
        label.validate(value: "Tap Action with 3 number of touches")
    }

    func test_view_swipes_action() {
        self.startApp()
        let label = self.tester.getLabel(with: "labelIdentifier")
        let view = self.tester.getView(with: "viewIdentifier")

        view.swipe(to: .up)
        label.validate(value: "Swipe Up Action")

        view.swipe(to: .down)
        label.validate(value: "Swipe Down Action")

        view.swipe(to: .left)
        label.validate(value: "Swipe Left Action")

        view.swipe(to: .right)
        label.validate(value: "Swipe Right Action")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
