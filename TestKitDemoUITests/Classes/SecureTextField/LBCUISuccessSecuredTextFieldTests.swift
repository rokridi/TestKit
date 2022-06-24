//
//  LBCUISuccessSecuredTextFieldTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Pierre A on 11/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessSecuredTextFieldTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithSecuredTextField

    func test_SecuredTextField() {
        self.startApp()
        let securedTextField = self.tester.getSecuredTextField(with: "textFieldIdentifier")
        let label = self.tester.getLabel(with: "labelIdentifier")

        securedTextField.fill(with: "updateText")
        label.validate(value: "updateText")

        securedTextField.clearText()
        label.validate(value: "")
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
