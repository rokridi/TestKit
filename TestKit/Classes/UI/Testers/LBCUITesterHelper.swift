//
//  LBCUITesterHelper.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 22/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCUITesterHelper {
    static weak var app: XCUIApplication?
    static weak var delegate: XCTActivity?

    static func assertTrue(_ condition: Bool, _ errorMessage: String? = nil) {
        if !condition {
            self.takeScreenshot()
            XCTAssertTrue(false, errorMessage ?? "")
        }
    }

    static func takeScreenshot() {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .deleteOnSuccess
        self.delegate?.add(attachment)
    }
}
