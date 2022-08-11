//
//  LBCScrollableTesterProtocol.swift
//  LBCTestKit
//
//  Created by Pierre A on 24/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

public protocol LBCScrollableTesterProtocol {
    typealias LBCTimeInSecond = Int
    /// Force system to scroll on the desired element. If element is not visible, scroll will continue until timeout
    /// - Parameters:
    ///   - identifier: the identifier of the element to scroll to
    ///   - direction: direct of scrolling
    ///   - timeout: in seconds, test will fail after the value. default is `10`
    func scroll(to identifier: LBCUIElementIdentifier, with direction: LBCUIElementSwipeDirection, timeout: LBCTimeInSecond?)

    /// Trigger pull to refresh
    @discardableResult
    func pullToRefresh() -> Self
}

extension LBCScrollableTesterProtocol where Self: LBCUIElementTester {
    func scroll(to identifier: LBCUIElementIdentifier, with direction: LBCUIElementSwipeDirection, timeout: LBCTimeInSecond?) {
        let _timeout: LBCTimeInSecond = timeout ?? 10
        let timeoutWorkItem = DispatchWorkItem(block: {
            XCTFail("Timeout on scroll to \(identifier)".logTaggedWithEmoji())
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(_timeout), execute: timeoutWorkItem)

        let elementToFind = self.element.descendants(matching: .any)[identifier]

        while elementToFind.isVisible == false {
            let frame = self.element.frame.size
            let startVector = CGVector(dx: 0.5, dy: 0.5)
            let startCoordinate = self.element.coordinate(withNormalizedOffset: startVector)

            let vector: CGVector
            switch direction {
            case .up:
                vector = .init(dx: startVector.dx, dy: -frame.height)
            case .down:
                vector = .init(dx: startVector.dx, dy: frame.height)
            case .left:
                vector = .init(dx: -frame.width, dy: startVector.dy)
            case .right:
                vector = .init(dx: frame.width, dy: startVector.dy)
            }
            let endCoordinate = startCoordinate.withOffset(vector)
            startCoordinate.press(forDuration: 0.01, thenDragTo: endCoordinate)
        }
        timeoutWorkItem.cancel()
    }

    @discardableResult
    func pullToRefresh() -> Self {
        let scrollViewTop: XCUIElement = self.element
        let start = scrollViewTop.coordinate(withNormalizedOffset: CGVector.zero)
        let finish = scrollViewTop.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 6))
        start.press(forDuration: 0, thenDragTo: finish)
        return self
    }
}
