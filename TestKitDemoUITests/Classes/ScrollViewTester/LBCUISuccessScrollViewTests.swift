//
//  LBCUISuccessScrollViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessScrollViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithScrollView
        super.setUp()
    }

    func test_ScrollView() {
        self.startApp()
        self.tester
            .getScrollView(with: "scrollViewIdentifier")
            .swipe(to: .up)
            .swipe(to: .down)
        self.tester.getScrollView(with: "scrollViewIdentifier")
            .scroll(to: "bottom.label",
                    with: .up,
                    timeout: 5)
    }

    func test_scrollView_pullToRefresh() {
        self.startApp()
        let scrollView = self.tester.getScrollView(with: "scrollViewIdentifier")

        _ = XCTExpectFailure("New label should not exist at this point") {
            self.tester.getLabel(with: "new.label")
        }

        scrollView.pullToRefresh()

        self.tester.getLabel(with: "new.label")
    }
}
