//
//  LBCUIFailureLinkTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Jean Di Giovanni on 12/07/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureLinkTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithLink
        super.setUp()
        self.startApp()
    }

    func test_link_wrongIdentifier() {
        XCTExpectFailure {
            self.tester
                .getLink(with: "This is not a link")
        }
    }

    func test_link_wrongLabel() {
        XCTExpectFailure {
            self.tester
                .getLink(with: "This is a link")
                .validate(label: "This is is not the link label")
        }
    }

    func test_link_shouldNotShowLabel_GivenTapPositionIsOutsideFrame() {
        XCTExpectFailure {
            self.tester
                .getLink(with: "This is a link")
                .tap(position: .absolute(x: -10, y: -10))
            self.tester
                .getLabel(with: "labelIdentifier")
        }
    }
}
