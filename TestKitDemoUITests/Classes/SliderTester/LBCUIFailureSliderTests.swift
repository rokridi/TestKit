//
//  LBCUIFailureSliderTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureSliderTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithSlider
        super.setUp()
    }

    func test_Slider_WrongIdentifier() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester.getSlider(with: "wrongIdentifier")
        }
    }

    func test_Slider_WrongSlideToValue() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSlider(with: "sliderIdentifier")
                .slide(toValue: 80)
                .validate(value: 50)
        }
    }

    func test_Slider_WrongValidationValue() {
        self.startApp(true)
        XCTExpectFailure {
            self.tester
                .getSlider(with: "sliderIdentifier")
                .validate(value: 45.0)
        }
    }
}
