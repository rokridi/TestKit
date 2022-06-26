//
//  LBCUISuccessTableViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessTableViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithTableViewNormalMode
        super.setUp()
    }

    func test_TableView_Validate_And_Tap_Cells() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .validateVisibleCells(cellsCount: 6)
            .validateCell(at: 3, hasLabel: "Value: 3")
            .validateCellExistence(at: 3)
            .validateCell(with: "cell_3", hasLabel: "Value: 3")
            .validateCellExistence(with: "cell_3")
            .tapOnCell(at: 3)
            .tapOnCell(at: 0)
            .tapOnCell(with: "cell_2")
            .tapOnCell(with: "cell_5")
    }

    func test_TableView_ReorderCell() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .reorderCell(at: 1, to: 4)
            .reorderCell(with: "cell_2", to: "cell_5")
    }

    func test_TableView_DeleteCell_AtIndex() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .deleteCell(at: 4, withText: "Delete")
    }

    func test_TableView_DeleteCell_WithIdentifier() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .deleteCell(with: "cell_4", andText: "Delete")
    }

    func test_TableView_Cell_SwipeLeftAndTapOnAction_AtIndex() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .swipeOnCell(at: 3, with: .left, andTapOnActionWithText: "Delete")
    }

    func test_TableView_Cell_SwipeLeftAndTapOnAction_WithIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .swipeOnCell(with: "cell_3", and: .left, andTapOnActionWithText: "Delete")
    }

    func test_TableView_Cell_SwipeRightAndTapOnAction_AtIndex() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .swipeOnCell(at: 3, with: .right, andTapOnActionWithText: "Action")
    }

    func test_TableView_Cell_SwipeRightAndTapOnAction_WithIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .swipeOnCell(with: "cell_3", and: .right, andTapOnActionWithText: "Action")
    }

    func test_TableView_Swipe_Action() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .swipe(to: .up)
            .swipe(to: .left)
            .swipe(to: .down)
            .swipe(to: .right)
    }

    func test_TableView_Scroll_To_Identifier() {
        self.homePageType = .homePageWithTableViewScrollableContent
        self.startApp(true)
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .scroll(to: "cell_40", with: .up, timeout: 30)
    }

    func test_TableView_Empty_PullToRefresh() {
        self.homePageType = .homePageWithTableViewEmptyPullToRefresh
        self.startApp(true)
        let tableView = self.tester
            .getTableView(with: "tableViewIdentifier")
            .pullToRefresh()
        _ = tableView.validateCellExistence(at: 0)
    }

    func test_TableView_PullToRefresh() {
        self.homePageType = .homePageWithTableViewPullToRefresh
        self.startApp(true)
        let tableView = self.tester
            .getTableView(with: "tableViewIdentifier")
            .pullToRefresh()
        _ = tableView.validateCellExistence(at: 2)
    }
}
