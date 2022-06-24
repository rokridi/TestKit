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
    private var homePageType: HomePageType = .homePageWithWebView

    func testWebView() {
        self.startApp()
        self.tester.getWebView(with: "webViewIdentifier")
            .validate(staticText: "Paragraph Title")
            .tap(onLinkText: "Lien externe")
            .validate(staticText: "Page 2")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }
}
