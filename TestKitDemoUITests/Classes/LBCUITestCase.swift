//
//  LBCUITestCase.swift
//  LBCTestKitTests
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest
@testable import TestKit


open class LBCUITestCase: XCTestCase, LBCTestKitConfigurationObjectProtocol {
    public private(set) var app: XCUIApplication!

    var envTestingConfiguration: String?
    var envHomePage: String?

    public private(set) var tester: LBCUIElementProvider!

    override open func setUp() {
        super.setUp()

        self.continueAfterFailure = false

        if self.shouldAutoStartApp() == true {
            self.startApp()
        }
    }

    public func startApp() {
        self.app = XCUIApplication()

        self.setLaunchArguments()
        self.setTestingConfiguration()

        self.app.launch()
        self.tester = LBCUITester(context: self.app)
    }

    private func setLaunchArguments() {
        let launchArguments = self.launchArguments()
        for argument in launchArguments {
            self.app.launchArguments.append(argument)
        }
    }

    private func setTestingConfiguration() {
        var envVariables = [String: String]()

        if let testingConfigurationKey = self.testingConfigurationKey() {
            envVariables[TESTKIT_CONFIGURATION_KEY] = testingConfigurationKey
        }
        if let testingHomePage = self.testingHomePageKey() {
            envVariables[TESTKIT_CONFIGURATION_HOMEPAGE_KEY] = testingHomePage
        }
        if let testingConfiguration = self.testingConfiguration()?.encodeToBase64String() {
            envVariables[TESKIT_CONFIGURATION_OBJECT_KEY] = testingConfiguration
        }

        self.app.launchEnvironment = envVariables
    }

    open func shouldAutoStartApp() -> Bool {
        return true
    }

    open func launchArguments() -> [String] {
        return []
    }

    open func testingConfigurationKey() -> String? {
        return nil
    }

    open func testingHomePageKey() -> String? {
        return nil
    }

    open func testingConfiguration() -> LBCTestKitConfigurationObjectProtocol? {
        return nil
    }
}
