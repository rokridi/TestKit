//
//  LBCScrollViewTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 11/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCScrollViewTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCScrollViewTester.getScrollView(with: identifier, in: context)
    }

    private static func getScrollView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let scrollView = context.scrollViews[identifier].firstMatch
        XCTAssertTrue(scrollView.waitForExistence(timeout: LBCTestTimeout.integration), "ScrollView with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return scrollView
    }
}

extension LBCScrollViewTester: LBCScrollViewTesterProtocol {
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self {
        let scrollView = self.element
        switch direction {
        case .left:
            scrollView.swipeLeft()
        case .right:
            scrollView.swipeRight()
        case .up:
            scrollView.swipeUp()
        case .down:
            scrollView.swipeDown()
        }
        return self
    }
}
