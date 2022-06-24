//
//  LBCUITestCaseHelper.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 23/06/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation
import XCTest

public class LBCUITestCaseHelper {
    static func startApp(dataSource: TestKitUITestsConfiguratorProtocol) -> (XCUIApplication, LBCUITester) {
        let app = XCUIApplication()
        let tester = LBCUITester(context: app)

        LBCUITestCaseHelper.setLaunchArguments(app: app, dataSource: dataSource)
        LBCUITestCaseHelper.setTestingConfiguration(app: app, dataSource: dataSource)

        app.launch()

        return (app, tester)
    }

    public static func startApp() -> (XCUIApplication, LBCUITester) {
        let app = XCUIApplication()
        let tester = LBCUITester(context: app)
        app.launch()
        return (app, tester)
    }

    private static func setLaunchArguments(app: XCUIApplication, dataSource: TestKitUITestsConfiguratorProtocol) {
        let launchArguments = dataSource.launchArguments()
        for argument in launchArguments {
            app.launchArguments.append(argument)
        }
    }

    private static func setTestingConfiguration(app: XCUIApplication, dataSource: TestKitUITestsConfiguratorProtocol) {
        var envVariables = [String: String]()

        if let testingConfigurationKey = dataSource.testingConfigurationKey() {
            envVariables[TESTKIT_CONFIGURATION_KEY] = testingConfigurationKey
        }
        if let testingHomePage = dataSource.testingHomePageKey() {
            envVariables[TESTKIT_CONFIGURATION_HOMEPAGE_KEY] = testingHomePage
        }
        if let testingConfiguration = dataSource.testingConfiguration()?.encodeToBase64String() {
            envVariables[TESKIT_CONFIGURATION_OBJECT_KEY] = testingConfiguration
        }
        app.launchEnvironment = envVariables
    }
}
