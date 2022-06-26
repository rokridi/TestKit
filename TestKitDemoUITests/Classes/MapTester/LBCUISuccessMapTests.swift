//
//  LBCUISuccessMapTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessMapTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithMap
        super.setUp()
        self.startApp()
    }

    func test_map_actions() {
        let map = self.tester
            .getMap(with: "mapIdentifier")
        let label = self.tester.getLabel(with: "labelIdentifier")
        let resetLabelButton = self.tester.getButton(with: "buttonIdentifier")
        label.validate(value: "INITIAL REGION")
        map.pinch(withScale: 2, velocity: 2)
        sleep(1)
        label.validate(value: "REGION DID CHANGE")
        resetLabelButton.tap()

        map.doubleTap()
        sleep(1)
        label.validate(value: "REGION DID CHANGE")
        resetLabelButton.tap()

        map.swipe(to: .left)
        sleep(2)
        label.validate(value: "REGION DID CHANGE")

    }
}
