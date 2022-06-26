//
//  LBCUISuccessLinkTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Jean Di Giovanni on 12/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessLinkTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithLink
        super.setUp()
    }

    func testLink_ShouldDisplayLabel_GivenDefaultTapMethod() {
        self.tester
            .getTextView(with: "textViewIdentifier")
            .validate(value: "This is a normal text. This is a link. This is another normal text.")

        self.tester
            .getLink(with: "This is a link")
            .validate(label: "This is a link")
            .tap()

        sleep(1)

        self.tester
            .getLabel(with: "labelIdentifier")
            .validate(value: "Link tapped!")
    }

    func testLink_ShouldDisplayLabel_GivenTapCenter() {
        self.assertWithTapPosition(tapPosition: .center)
    }

    func testLink_ShouldDisplayLabel_GivenTapAbsolute() {
        self.assertWithTapPosition(tapPosition: .absolute(x: 10, y: 10))
    }

    func testLink_ShouldDisplayLabel_GivenTapOriginAndiOS13Min() {
        self.assertWithTapPosition(tapPosition: .origin)
    }

    private func assertWithTapPosition(tapPosition: LBCUIElementTapPosition) {
        self.tester
            .getTextView(with: "textViewIdentifier")
            .validate(value: "This is a normal text. This is a link. This is another normal text.")

        self.tester
            .getLink(with: "This is a link")
            .validate(label: "This is a link")
            .tap(position: tapPosition)

        sleep(1)

        self.tester
            .getLabel(with: "labelIdentifier")
            .validate(value: "Link tapped!")
    }
}
