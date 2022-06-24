//
//  LBCTableViewTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCTableViewTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCTableViewTester.getTableView(with: identifier, in: context)
    }

    private static func getTableView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let tableView = context.tables[identifier].firstMatch
        XCTAssertTrue(tableView.waitForExistence(timeout: LBCTestTimeout.integration), "TableView with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return tableView
    }
}

extension LBCTableViewTester: LBCTableViewTesterProtocol {
    @discardableResult
    func validateVisibleCells(cellsCount: Int) -> Self {
        let tableView = self.element
        XCTAssertEqual(tableView.cells.count, cellsCount, "TableView - wrong number of cells".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCell(at index: Int, hasLabel label: String) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(boundBy: index)
        XCTAssertTrue(cell.staticTexts[label].exists, "TableView - wrong expected text value after getting cell by index".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCellExistence(at index: Int) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(boundBy: index)
        XCTAssertTrue(cell.exists, "TableView - the cell does not exist at this index".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCell(with identifier: LBCUIElementIdentifier, hasLabel label: String) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(matching: .cell, identifier: identifier).firstMatch
        XCTAssertTrue(cell.staticTexts[label].exists, "TableView - wrong expected text value after getting cell by identifier".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCellExistence(with identifier: LBCUIElementIdentifier) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(matching: .cell, identifier: identifier).firstMatch
        XCTAssertTrue(cell.exists, "TableView - can't found cell with the given identifier".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func tapOnCell(at index: LBCUIElementIndex) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(boundBy: index)
        cell.tap()
        return self
    }

    @discardableResult
    func tapOnCell(with identifier: LBCUIElementIdentifier) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(matching: .cell, identifier: identifier).firstMatch
        cell.tap()
        return self
    }

    @discardableResult
    func reorderCell(at atIndex: LBCUIElementIndex, to toIndex: LBCUIElementIndex) -> Self {
        let tableView = self.element
        let prediction = NSPredicate(format: "label BEGINSWITH[cd] 'Reorder'")
        let fromButton = tableView.cells.element(boundBy: atIndex).buttons.element(matching: prediction).firstMatch
        let toButton = tableView.cells.element(boundBy: toIndex).buttons.element(matching: prediction).firstMatch
        fromButton.press(forDuration: 0.5, thenDragTo: toButton)
        return self
    }

    @discardableResult
    func reorderCell(with withIdentifier: LBCUIElementIdentifier, to toIdentifier: LBCUIElementIdentifier) -> Self {
        let tableView = self.element
        let prediction = NSPredicate(format: "label BEGINSWITH[cd] 'Reorder'")
        let fromButton = tableView.cells.element(matching: .cell, identifier: withIdentifier).firstMatch.buttons.element(matching: prediction).firstMatch
        let toButton = tableView.cells.element(matching: .cell, identifier: toIdentifier).firstMatch.buttons.element(matching: prediction).firstMatch
        fromButton.press(forDuration: 0.5, thenDragTo: toButton)
        return self
    }

    @discardableResult
    func deleteCell(at index: LBCUIElementIndex, withText text: String) -> Self {
        let tableView = self.element
        let prediction = NSPredicate(format: "label BEGINSWITH[cd] '\(text)'")
        let cell = tableView.cells.element(boundBy: index)
        let deleteButton = cell.buttons.element(matching: prediction).firstMatch
        deleteButton.tap()
        cell.buttons[text].tap()
        return self
    }

    @discardableResult
    func deleteCell(with identifier: LBCUIElementIdentifier, andText text: String) -> Self {
        let tableView = self.element
        let prediction = NSPredicate(format: "label BEGINSWITH[cd] '\(text)'")
        let cell = tableView.cells.element(matching: .cell, identifier: identifier).firstMatch
        let deleteButton = cell.buttons.element(matching: prediction).firstMatch
        deleteButton.tap()
        cell.buttons[text].tap()
        return self
    }

    func swipeOnCell(at index: LBCUIElementIndex, with direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(boundBy: index)

        switch direction {
        case .left:
            cell.swipeLeft()
        case .right:
            cell.swipeRight()
        }

        cell.buttons[text].tap()
        return self

    }

    func swipeOnCell(with identifier: LBCUIElementIdentifier, and direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self {
        let tableView = self.element
        let cell = tableView.cells.element(matching: .cell, identifier: identifier).firstMatch

        switch direction {
        case .left:
            cell.swipeLeft()
        case .right:
            cell.swipeRight()
        }

        cell.buttons[text].tap()
        return self
    }

    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self {
        let tableView = self.element
        switch direction {
        case .up:
            tableView.swipeUp()
        case .left:
            tableView.swipeLeft()
        case .right:
            tableView.swipeRight()
        case .down:
            tableView.swipeDown()
        }
        return self
    }
}
