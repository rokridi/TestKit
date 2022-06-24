//
//  LBCUIFailureTableViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureTableViewTests: LBCUITestCase {

    private var homePageType: HomePageType = .homePageWithTableViewNormalMode

    func test_TableView_WrongIdentifier() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "wrongIdentifier")
        }
    }

    func test_TableView_WrongNumberOfCells() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateVisibleCells(cellsCount: 8)
        }
    }

    func test_TableView_ValidateCell_AtIndex_HasWrongLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(at: 3, hasLabel: "Height")
        }
    }

    func test_TableView_ValidateCell_AtWrongIndex_HasWrongLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(at: 8, hasLabel: "Height")
        }
    }

    func test_TableView_ValidateCell_AtWrongIndex_HasLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(at: 8, hasLabel: "Zero")
        }
    }

    func test_TableView_ValidateCell_WithWrongIdentifier_HasWrongLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(with: "cell_8", hasLabel: "Height")
        }
    }

    func test_TableView_ValidateCell_WithIdentifier_HasWrongLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(with: "cell_2", hasLabel: "Twice")
        }
    }

    func test_TableView_ValidateCell_WithWrongIdentifier_HasLabel_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .validateCell(with: "wrongIdentifier", hasLabel: "Zero")
        }
    }

    func test_TableView_TapOnCell_AtIndex_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .tapOnCell(at: 8)
        }
    }

    func test_TableView_TapOnCellFromIdentifier_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .tapOnCell(with: "cell_8")
        }
    }

    func test_TableView_ReorderCellFromIndex_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .reorderCell(at: 1, to: 9)
        }
    }

    func test_TableView_ReorderCellFromIdentifier_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            self.tester
                .getTableView(with: "tableViewIdentifier")
                .reorderCell(with: "cell_1", to: "cell_9")
        }
    }

    func test_TableView_DeleteCell_AtIndex_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .deleteCell(at: 9, withText: "Delete")
        }
    }

    func test_TableView_DeleteCell_WithIdentifier_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .deleteCell(with: "cell_9", andText: "Delete")
        }
    }

    func test_TableView_DeleteCell_AtIndex_Failure_WrongText() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .deleteCell(at: 3, withText: "Supprimer")
        }
    }

    func test_TableView_DeleteCell_WithIdentifier_Failure_WrongText() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .deleteCell(with: "cell_3", andText: "Supprimer")
        }
    }

    func test_TableView_DeleteCell_AtIndex() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .deleteCell(at: 4, withText: "Delete")
    }

    func test_TableView_DeleteCell_WithIdentifier() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        self.tester
            .getTableView(with: "tableViewIdentifier")
            .deleteCell(with: "cell_4", andText: "Delete")
    }

    func test_TableView_Cell_SwipeLeftAndTapToAction_AtIndex_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(at: 8, with: .left, andTapOnActionWithText: "Delete")
        }
    }

    func test_TableView_Cell_SwipeLeftAndTapToAction_WithIdentifier_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(with: "cell_8", and: .left, andTapOnActionWithText: "Delete")
        }
    }

    func test_TableView_Cell_SwipeLeftAndTapToAction_AtIndex_WrongText_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(at: 4, with: .left, andTapOnActionWithText: "WrongText")
        }
    }

    func test_TableView_Cell_SwipeLeftAndTapToAction_WithIdentifier_WrongText_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(with: "cell_4", and: .left, andTapOnActionWithText: "WrongText")
        }
    }

    func test_TableView_Cell_SwipeRightAndTapToAction_AtIndex_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(at: 8, with: .right, andTapOnActionWithText: "Action")
        }
    }

    func test_TableView_Cell_SwipeRightAndTapToAction_WithIdentifier_Failure() {
        self.homePageType = .homePageWithTableViewNormalMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(with: "cell_8", and: .right, andTapOnActionWithText: "Action")
        }
    }

    func test_TableView_Cell_SwipeRightAndTapToAction_AtIndex_WrongText_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(at: 4, with: .right, andTapOnActionWithText: "WrongText")
        }
    }

    func test_TableView_Cell_SwipeRightAndTapToAction_WithIdentifier_WrongText_Failure() {
        self.homePageType = .homePageWithTableViewEditMode
        self.startApp()
        XCTExpectFailure {
            _ = self.tester
                .getTableView(with: "tableViewIdentifier")
                .swipeOnCell(with: "cell_4", and: .right, andTapOnActionWithText: "WrongText")
        }
    }

    override func testingHomePageKey() -> String? {
        return self.homePageType.rawValue
    }

    override func shouldAutoStartApp() -> Bool {
        return false
    }

}
