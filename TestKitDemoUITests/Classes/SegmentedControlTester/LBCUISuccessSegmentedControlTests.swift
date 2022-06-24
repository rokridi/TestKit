//
//  LBCUISuccessSegmentedControlTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessSegmentedControlTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithSegmentedControl

    func test_SegmentedControl_Tap_AtIndex_ValidateTextValue_ValidateSelectionState() {
        self.startApp()
        self.tester
            .getSegmentedControl(with: "segmentedControlIdentifier")
            .validate(textValue: "First", at: 0)
            .validate(selectionState: true, at: 0)
            .tap(at: 1)
            .validate(textValue: "Second", at: 1)
            .validate(selectionState: true, at: 1)
            .validate(selectionState: false, at: 0)
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
