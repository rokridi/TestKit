//
//  LBCUISuccessCollectionViewTests.swift
//  LBCTestKitDemoUITests
//
//  Created by Berangere LATOUCHE on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

final class LBCUISuccessCollectionViewTests: LBCUITestCase {

    override func setUp() {
        self.homePageType = .homePageWithCollectionView
        super.setUp()
    }

    func test_CollectionView_Validate_And_Tap_Cells() {
        self.tester
            .getCollectionView(with: "collectionViewIdentifier")
            .validateVisibleCells(cellsCount: 6)
            .validateCellExistence(at: 3)
            .validateCellExistence(with: "cell_Three")
            .tapOnCell(at: 3)
            .tapOnCell(at: 0)
            .tapOnCell(with: "cell_Three")
            .tapOnCell(with: "cell_Four")
    }

    func test_CollectionView_DragAndDropCell() {
        self.tester
            .getCollectionView(with: "collectionViewIdentifier")
            .dragAndDropCell(at: 1, to: 4)
            .dragAndDropCell(with: "cell_Two", to: "cell_Five")
    }

    func test_CollectionView_Swipe_And_ScrollTo() {
        self.tester
            .getCollectionView(with: "collectionViewIdentifier")
            .swipe(to: .up)
            .swipe(to: .left)
            .swipe(to: .right)
            .swipe(to: .down)

        self.tester
            .getCollectionView(with: "collectionViewIdentifier")
            .scroll(to: "cell_Five",
                    with: .up,
                    timeout: 1)
    }

    func test_CollectionView_PullToRefresh() {
        self.tester
            .getCollectionView(with: "collectionViewIdentifier")
            .pullToRefresh()

        _ = self.tester.getCell(with: "cell_New_Zero")
    }
}
