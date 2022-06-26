//
//  LBCDefaultTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 22/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

class LBCDefaultTester {
    weak var app: XCUIApplication?
    weak var delegate: XCTActivity?

    init(app: XCUIApplication, delegate: XCTActivity? = nil) {
        self.app = app
        self.delegate = delegate
    }
}
