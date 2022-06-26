//
//  LBCUIElementTapPosition.swift
//  LBCTestKit
//
//  Created by Jean Di Giovanni on 12/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

/// Enum representing a tap position on a LBCUIElement
public enum LBCUIElementTapPosition: Equatable {
    /// native XCTest tap position
    case native
    /// origin position of the frame (top left position)
    case origin
    /// center position of the frame
    case center
    /// absolute position on the frame (starting at the top left origin point)
    case absolute(x: CGFloat, y: CGFloat)
}
