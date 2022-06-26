//
//  LBCUIFailureCellTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureCellTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTableViewNormalMode
        super.setUp()
    }

    func test_Cell_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester.getCell(with: "wrongIdentifier")

    }

    func test_GetTableViewCell_WrongIndex() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester.getCell(boundBy: 99)
    }

    func test_CellWrongLabel() {
        self.homePageType = .homePageWithTableViewNormalMode
        let cell = self.tester.getCell(with: "cell_3")

        XCTExpectFailure()
        cell.validate(withLabel: "wrongLabel")
    }

    func test_Cell_Tap_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_78")
            .tap()
    }

    func test_Cell_Delete_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewEditMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_78")
            .delete(withText: "Delete")
    }

    func test_Cell_SwipeLeft_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_78")
            .swipe(.left, andTapOnActionWithText: "Delete")
    }

    func test_Cell_SwipeRight_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_78")
            .swipe(.right, andTapOnActionWithText: "Delete")
    }

    func test_Cell_Delete_WrongText() {
        self.homePageType = .homePageWithTableViewEditMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_3")
            .delete(withText: "WrongText")
    }

    func test_Cell_SwipeLeft_WrongText() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_3")
            .swipe(.left, andTapOnActionWithText: "WrongText")
    }

    func test_Cell_SwipeRight_WrongText() {
        self.homePageType = .homePageWithTableViewNormalMode

        XCTExpectFailure()
        self.tester
            .getCell(with: "cell_3")
            .swipe(.right, andTapOnActionWithText: "WrongText")
    }

    func test_Cell_Content_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode
        let cellContent = self.tester
            .getCell(with: "cell_3")
            .content

        XCTExpectFailure()
        cellContent.getTextField(with: "cell_wrongTextLabel")
    }

    func test_GetCollectionViewCell_WrongIdentifier() {
        self.homePageType = .homePageWithCollectionView

        XCTExpectFailure()
        self.tester.getCell(with: "cell_xx")
    }

    func test_GetCollectionViewCell_WrongIndex() {
        self.homePageType = .homePageWithCollectionView

        XCTExpectFailure()
        self.tester.getCell(boundBy: 99)
    }
}
