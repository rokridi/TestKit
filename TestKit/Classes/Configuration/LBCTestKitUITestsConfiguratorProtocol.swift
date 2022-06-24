//
//  LBCTestKitUITestsConfiguratorProtocol.swift
//  LBCTestKit
//
//  Created by Aliou.Sarr on 10/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

/// This protocol will replace LBCUITestsConfiguratorProtocol
/// We need to keep the 2 for now because LBCUITestsConfiguratorProtocol still used in all UI Tests
protocol TestKitUITestsConfiguratorProtocol {
    /// Whether or not to launch the app when the test is called
    /// if false startApp() should be called manually
    func shouldAutoStartApp() -> Bool
    func launchArguments() -> [String]
    /// A string value used to pass the configuration enum rawValue to the host app
    func testingConfigurationKey() -> String?
    /// A string value used to pass the page enum rawValue to the host app
    func testingHomePageKey() -> String?
    /// A configuration object which will be serialized to be passed to host app
    func testingConfiguration() -> LBCTestKitConfigurationObjectProtocol?
}

extension TestKitUITestsConfiguratorProtocol {
    func shouldAutoStartApp() -> Bool {
        return true
    }
    func launchArguments() -> [String] {
        return []
    }
    func testingConfigurationKey() -> String? {
        return nil
    }
    func testingHomePageKey() -> String? {
        return nil
    }
    func testingConfiguration() -> LBCTestKitConfigurationObjectProtocol? {
        return nil
    }
}
