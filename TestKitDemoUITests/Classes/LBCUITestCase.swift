//
//  LBCUITestCase.swift
//  LBCTestKitTests
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit

open class LBCUITestCase: XCTestCase {
    public private(set) var app: XCUIApplication!

    var homePageType: HomePageType?

    public private(set) var tester: LBCUIElementProvider!

    override open func setUp() {
        super.setUp()
        self.continueAfterFailure = false
        self.startApp()
    }

    public func startApp() {
        self.app = XCUIApplication()
        self.app.launch()
        self.tester = LBCUITester(context: self.app)
        if let homePageType = homePageType {
            self.tester.getCollectionView(with: "collectionViewIdentifier")
                .tapOnCell(with: homePageType.rawValue)
        }
    }
}
