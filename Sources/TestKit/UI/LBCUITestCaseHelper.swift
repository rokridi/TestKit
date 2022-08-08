//
//  LBCUITestCaseHelper.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 23/06/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation
import XCTest


public class LBCUITestCaseHelper {
    public static func startApp() -> (XCUIApplication, LBCUITester) {
        let app = XCUIApplication()
        let tester = LBCUITester(context: app)
        app.launch()
        return (app, tester)
    }
}
