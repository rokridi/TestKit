//
//  LBCViewTester.swift
//  LBCTestKitTests
//
//  Created by Damien Bannerot on 15/09/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCViewTester {
    private let context: XCUIElement
    var element: XCUIElement
    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCViewTester.getView(with: identifier, in: context)
    }
    private static func getView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let view = context.otherElements[identifier].firstMatch
        XCTAssertTrue(view.waitForExistence(timeout: LBCTestTimeout.integration), "View with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return view
    }
}

extension LBCViewTester: LBCViewTesterProtocol {
    func validate(state: LBCUIElementViewState) -> Self {
        let view = self.element
        switch state {
        case .enable:
            XCTAssertTrue(view.isEnabled, "view wrong enable state".logTaggedWithEmoji())
        case .disable:
            XCTAssertFalse(view.isEnabled, "view wrong disable state".logTaggedWithEmoji())
        case .selected:
            XCTAssertTrue(view.isSelected, "view wrong selected state".logTaggedWithEmoji())
        case.unselected:
            XCTAssertFalse(view.isSelected, "view wrong selected state".logTaggedWithEmoji())

        }
        return self
    }

    func tap() -> Self {
        let view = self.element
        view.tap()
        return self
    }

    func doubleTap() -> Self {
        let view = self.element
        view.doubleTap()
        return self
    }

    func press(forDuration duration: TimeInterval) -> Self {
        let view = self.element
        view.press(forDuration: duration)
        return self
    }

    func twoFingerTap() -> Self {
        let view = self.element
        view.twoFingerTap()
        return self
    }

    func tap(withNumberOfTaps numberOfTaps: Int, numberOfTouches: Int) -> Self {
        let view = self.element
        view.tap(withNumberOfTaps: numberOfTaps, numberOfTouches: numberOfTouches)
        return self
    }

    func swipe(to direction: LBCUIElementSwipeDirection) -> Self {
        let view = self.element
        switch direction {
        case .left:
            view.swipeLeft()
        case .right:
            view.swipeRight()
        case .up:
            view.swipeUp()
        case .down:
            view.swipeDown()
        }
        return self
    }
}
