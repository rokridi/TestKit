//
//  LBCCellTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCCellTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCCellTester.getCell(with: identifier, in: context)
    }

    init(index: LBCUIElementIndex, in context: XCUIElement) {
        self.context = context
        self.element = LBCCellTester.getCell(boundBy: index, in: context)
    }

    private static func getCell(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let cell = context.cells[identifier].firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: LBCTestTimeout.integration), "Cell with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return cell
    }

    private static func getCell(boundBy index: LBCUIElementIndex, in context: XCUIElement) -> XCUIElement {
        let cell = context.cells.element(boundBy: index).firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: LBCTestTimeout.integration), "Cell at index \"\(index)\" does not exist.".logTaggedWithEmoji())
        return cell
    }
}

extension LBCCellTester: LBCCellTesterProtocol {
    @discardableResult
    func validate(withLabel label: String) -> Self {
        let cell = self.element
        XCTAssertTrue(cell.staticTexts[label].exists, "Cell - wrong expected label".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func tap() -> Self {
        let cell = self.element
        cell.tap()
        return self
    }

    @discardableResult
    func delete(withText text: String) -> Self {
        let cell = self.element
        let prediction = NSPredicate(format: "label BEGINSWITH[cd] '\(text)'")
        let deleteButton = cell.buttons.element(matching: prediction).firstMatch
        deleteButton.tap()
        cell.buttons[text].tap()
        return self
    }

    @discardableResult
    func swipeAndTapToAction(withText text: String) -> Self {
        let cell = self.element
        cell.swipeLeft()
        cell.buttons[text].tap()
        return self
    }

    func swipe(_ direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self {
        let cell = self.element

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
    func validate(state: LBCUIElementCellState) -> Self {
        let cell = self.element
        switch state {
        case .selected:
            XCTAssertTrue(cell.isSelected, "cell wrong selected state".logTaggedWithEmoji())
        case.unselected:
            XCTAssertFalse(cell.isSelected, "cell wrong selected state".logTaggedWithEmoji())
        }
        return self
    }
}
