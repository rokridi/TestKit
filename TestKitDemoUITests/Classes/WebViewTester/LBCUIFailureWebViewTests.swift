//
//  LBCUIFailureWebViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureWebViewTests: LBCUITestCase {
    override func setUp() {
        self.homePageType = .homePageWithWebView
        super.setUp()
    }

    func test_get_webView_wrong_identifier() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getWebView(with: "wrongIdentifier")
        }
    }

    func test_webView_find_text_failure() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getWebView(with: "webViewIdentifier")
                .validate(staticText: "XXXX")
        }
    }

    func test_webView_tap_link_text_failure() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getWebView(with: "webViewIdentifier")
                .tap(onLinkText: "XXXXX")
        }
    }

    func test_webView_validate_tap_link_redirection_failure() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getWebView(with: "webViewIdentifier")
                .tap(onLinkText: "Lien externe")
                .validate(staticText: "XXXX")
        }
    }
}
