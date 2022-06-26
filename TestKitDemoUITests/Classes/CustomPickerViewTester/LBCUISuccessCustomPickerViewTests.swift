//
//  LBCUISuccessCustomPickerViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

import XCTest
@testable import TestKit

final class LBCUISuccessCustomPickerViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithCustomPickerView
        super.setUp()
    }

    func test_custom_picker_view() {
        self.startApp(true)
        self.tester
            .getPicker(with: "customPickerView")
            .validate(textValue: "ITEM 1-1", atIndex: 0)
            .validate(textValue: "ITEM 2-1", atIndex: 1)
            .move(toTextValue: "ITEM 1-3", atIndex: 0)
            .move(toTextValue: "ITEM 2-3", atIndex: 1)
            .validate(textValue: "ITEM 1-3", atIndex: 0)
            .validate(textValue: "ITEM 2-3", atIndex: 1)
    }

}
