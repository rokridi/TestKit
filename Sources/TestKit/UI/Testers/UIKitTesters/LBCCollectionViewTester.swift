//
//  LBCCollectionViewTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCCollectionViewTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCCollectionViewTester.getCollectionView(with: identifier, in: context)
    }

    private static func getCollectionView(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let collectionView = context.collectionViews[identifier].firstMatch
        XCTAssertTrue(collectionView.waitForExistence(timeout: LBCTestTimeout.integration), "CollectionView with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return collectionView
    }
}

extension LBCCollectionViewTester: LBCCollectionViewTesterProtocol {
    @discardableResult
    func validateVisibleCells(cellsCount: Int) -> Self {
        let collectionView = self.element
        XCTAssertEqual(collectionView.cells.count, cellsCount, "CollectionView - wrong number of cells".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCellExistence(with identifier: LBCUIElementIdentifier) -> Self {
        let collectionView = self.element
        let cell = collectionView.cells.element(matching: .cell, identifier: identifier).firstMatch
        XCTAssertTrue(cell.exists, "CollectionView - can't found cell with the given identifier".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validateCellExistence(at index: LBCUIElementIndex) -> Self {
        let collectionView = self.element
        let cell = collectionView.cells.element(boundBy: index)
        XCTAssertTrue(cell.exists, "CollectionView - the cell does not exist at this index".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func tapOnCell(at index: LBCUIElementIndex) -> Self {
        let collectionView = self.element
        let cell = collectionView.cells.element(boundBy: index)
        cell.tap()
        return self
    }

    @discardableResult
    func tapOnCell(with identifier: LBCUIElementIdentifier) -> Self {
        let collectionView = self.element
        let cell = collectionView.cells.element(matching: .cell, identifier: identifier).firstMatch
        cell.tap()
        return self
    }

    @discardableResult
    func dragAndDropCell(at atIndex: LBCUIElementIndex, to toIndex: LBCUIElementIndex) -> Self {
        let collectionView = self.element
        let fromCell = collectionView.cells.element(boundBy: atIndex)
        let toCell = collectionView.cells.element(boundBy: toIndex)
        fromCell.press(forDuration: 0.5, thenDragTo: toCell)
        return self
    }

    @discardableResult
    func dragAndDropCell(with withIdentifier: LBCUIElementIdentifier, to toIdentifier: LBCUIElementIdentifier) -> Self {
        let collectionView = self.element
        let fromCell = collectionView.cells.element(matching: .cell, identifier: withIdentifier).firstMatch
        let toCell = collectionView.cells.element(matching: .cell, identifier: toIdentifier).firstMatch
        fromCell.press(forDuration: 0.5, thenDragTo: toCell)
        return self
    }

    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self {
        let collectionView = self.element
        switch direction {
        case .up:
            collectionView.swipeUp()
        case .left:
            collectionView.swipeLeft()
        case .right:
            collectionView.swipeRight()
        case .down:
            collectionView.swipeDown()
        }
        return self
    }
}
