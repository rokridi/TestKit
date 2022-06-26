//
//  LBCUISucessCellTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessCellTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTableViewNormalMode
        super.setUp()
        self.startApp(true)
    }

    func test_Cell_ValidateCellWithLabel_DeleteWithButton() {
        self.tester.getCell(boundBy: 2)
            .validate(withLabel: "Value: 2")
            .delete(withText: "Delete")

        self.tester
            .getCell(with: "cell_3")
            .validate(withLabel: "Value: 3")
            .delete(withText: "Delete")
    }

    func test_Cell_ValidateCellWithLabel_SwipeLeftToAction() {
        let cell = self.tester.getCell(with: "cell_3")

        cell.validate(withLabel: "Value: 3")
            .content
            .getLabel(with: "cell_textLabel")
            .validate(value: "Value: 3")

        cell.swipe(.left, andTapOnActionWithText: "Delete")
    }

    func test_Cell_ValidateCellWithLabel_SwipeRightToAction() {
        let cell = self.tester.getCell(with: "cell_3")

        cell.validate(withLabel: "Value: 3")
            .content
            .getLabel(with: "cell_textLabel")
            .validate(value: "Value: 3")

        cell.swipe(.right, andTapOnActionWithText: "Action")
    }

    func testGetCollectionViewCell_validateState() {
        self.tester.getCell(with: "cell_Three")
            .validate(state: .unselected)
            .tap()
            .validate(state: .selected)

        self.tester.getCell(boundBy: 3)
            .validate(state: .selected)
    }
}
