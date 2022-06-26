//
//  XCUIElement+Extensions.swift
//  LBCTestKit
//
//  Created by Pierre A on 24/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    var isVisible: Bool {
        guard self.exists,
              self.isHittable,
              self.frame.isEmpty == false
        else {
            return false
        }
        return XCUIApplication().windows.element(boundBy: 0).frame.intersects(self.frame)
    }

    func tap(position: LBCUIElementTapPosition) {
        if position == .native {
            self.tap()
        } else {
            self.getCoordinate(position: position).tap()
        }
    }
}

private extension XCUIElement {
    private func getCoordinate(position: LBCUIElementTapPosition) -> XCUICoordinate {
        let xCoordinate: CGFloat
        let yCoordinate: CGFloat

        switch position {
        case .absolute(let x, let y):
            xCoordinate = self.frame.minX + x
            yCoordinate = self.frame.minY + y
        case .center:
            xCoordinate = self.frame.midX
            yCoordinate = self.frame.midY
        case .origin:
            xCoordinate = self.frame.minX
            yCoordinate = self.frame.minY
        default:
            xCoordinate = self.frame.minX
            yCoordinate = self.frame.minY
        }

        let normalizedCoordinate = XCUIApplication()
            .coordinate(withNormalizedOffset: CGVector.zero)
            .withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))

        return normalizedCoordinate
    }
}
