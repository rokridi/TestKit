//
//  LBCWebViewTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCWebViewTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCWebViewTester.getWebView(with: identifier, in: context)
    }

    private static func getWebView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let webView: XCUIElement
        webView = context.webViews[identifier].firstMatch
        XCTAssertTrue(webView.waitForExistence(timeout: LBCTestTimeout.integration), "WebView with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return webView
    }
}

extension LBCWebViewTester: LBCWebViewTesterProtocol {
    func tap(onLinkText linkText: String) -> Self {
        let webView = self.element
        webView.links[linkText].tap()
        return self
    }

    func validate(staticText value: String) -> Self {
        let webView = self.element
        let staticText: XCUIElement
        staticText = webView.staticTexts[value]
        XCTAssertTrue(staticText.waitForExistence(timeout: LBCTestTimeout.integration), "WebView static text \"\(value)\" does not exist.".logTaggedWithEmoji())
        return self
    }
}
