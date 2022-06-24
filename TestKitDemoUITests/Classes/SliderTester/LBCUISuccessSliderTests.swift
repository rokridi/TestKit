//
//  LBCUISuccessSliderTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessSliderTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSlider
        super.setUp()
    }

    func test_Slider_SlideToValue_ValidateValue() {
        self.startApp()
        self.tester
            .getSlider(with: "sliderIdentifier")
            .slide(toValue: 80.0)
            .validate(value: 80.0)
    }
}
