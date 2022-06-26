//
//  LBCUIFailureCollectionViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUIFailureCollectionViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithCollectionView
        super.setUp()
        self.startApp()
    }

    func test_CollectionView_WrongIdentifier() {
        XCTExpectFailure {
            self.tester.getCollectionView(with: "wrongIdentifier")
        }
    }

    func test_CollectionView_WrongNumberOfCells() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .validateVisibleCells(cellsCount: 28)
        }

    }

    func test_CollectionView_ValidateCell_WrongIndex() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .validateCellExistence(at: 90)
        }
    }

    func test_CollectionView_ValidateCell_WrongIdentifier() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .validateCellExistence(with: "wrongCellIdentifier")
        }
    }

    func test_CollectionView_TapOnCell_WrongIndex() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .tapOnCell(at: 67)
        }
    }

    func test_CollectionView_TapOnCell_WrongIdentifier() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .tapOnCell(with: "wrongCellIdentifier")
        }
    }

    func test_CollectionView_DragAndDrop_WrongAtIndex_toIndex() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(at: 87, to: 4)
        }
    }

    func test_CollectionView_DragAndDrop_AtIndex_WrongToIndex() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(at: 3, to: 87)
        }
    }

    func test_CollectionView_DragAndDrop_WrongAtIndex_WrongToIndex() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(at: 45, to: 87)
        }
    }

    func test_CollectionView_DragAndDrop_WrongWithIdentifier_toIdentifier() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(with: "wrongCellIdentifier", to: "cell_3")
        }
    }

    func test_CollectionView_DragAndDrop_WithIdentifier_WrongToIdentifier() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(with: "cell_3", to: "wrongCellIdentifier")
        }
    }

    func test_CollectionView_DragAndDrop_WrongWithIdentifier_WrongToIdentifier() {
        XCTExpectFailure {
            self.tester
                .getCollectionView(with: "collectionViewIdentifier")
                .dragAndDropCell(with: "wrongCellIdentifier", to: "wrongCellIdentifier")
        }
    }
}
