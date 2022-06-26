//
//  LBCMapTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCMapTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCMapTester.getMap(with: identifier, in: context)
    }

    private static func getMap(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let map = context.otherElements[identifier]
        XCTAssertTrue(map.waitForExistence(timeout: LBCTestTimeout.integration), "Map with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return map
    }
}

extension LBCMapTester: LBCMapTesterProtocol {
    func doubleTap() -> Self {
        let map = self.element
        map.doubleTap()
        return self
    }

    func swipe(to direction: LBCUIElementSwipeDirection) -> Self {
        let map = self.element
        switch direction {
        case .left:
            map.swipeLeft()
        case .right:
            map.swipeRight()
        case .up:
            map.swipeUp()
        case .down:
            map.swipeDown()
        }
        return self
    }

    func pinch(withScale scale: CGFloat, velocity: CGFloat) -> Self {
        let map = self.element
        map.pinch(withScale: scale, velocity: velocity)
        return self
    }


}
