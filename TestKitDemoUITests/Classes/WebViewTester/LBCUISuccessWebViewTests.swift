//
//  LBCUISuccessWebViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessWebViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithWebView
        super.setUp()
    }

    func testWebView() {
        self.startApp(true)
        self.tester.getWebView(with: "webViewIdentifier")
            .validate(staticText: "Paragraph Title")
            .tap(onLinkText: "Lien externe")
            .validate(staticText: "Page 2")
    }
}
