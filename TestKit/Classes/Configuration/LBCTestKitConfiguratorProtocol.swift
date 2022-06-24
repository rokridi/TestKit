//
//  LBCTestKitConfiguratorProtocol.swift
//  LBCTestKit
//
//  Created by Aliou.Sarr on 06/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

protocol LBCTestKitConfiguratorProtocol {
    /// Method called before each test to apply a configuration
    /// - Parameter key: the rawValue of an enum used to determine the configuration
    func applyTestkitConfiguration(key: String)
    /// Method called after applying any configuration to set up the page that needs testing
    /// - Parameter key: the rawValue of an enum used to determine the page to test
    func applyTestkitHomePage(key: String)
    /// Method called before each test to apply a configuration
    /// - Parameters:
    ///   - configuration: A LBCUITestsConfigurationProtocol object that must be decoded using decode(from:)
    ///   - page: the rawValue of an enum used to determine the page to test
    func applyTestkitConfiguration(configuration: String, page: String)
}

extension LBCTestKitConfiguratorProtocol {
    func applyTestkitConfiguration(key: String) { }
    func applyTestkitConfiguration(configuration: String, page: String) { }
}
