//
//  LBCUIElementTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 01/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

public protocol LBCUIElementTester {
    var element: XCUIElement { get }

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement)
}
