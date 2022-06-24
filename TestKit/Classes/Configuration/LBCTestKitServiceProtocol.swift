//
//  LBCTestKitServiceProtocol.swift
//  LBCTestKit
//
//  Created by Aliou.Sarr on 09/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

protocol LBCTestKitServiceProtocol {
    /// Method called before each test to apply a testing environment
    /// it calls the following configurator methods if needed
    /// - applyTestkitConfiguration(key: String)
    /// - applyTestkitHomePage(key: String)
    /// - applyTestkitConfiguration(configuration: String, page: String)
    func applyTestingEnvironment() -> Bool

    /// Service initializer
    /// - Parameters:
    ///   - configurator : configurator object who conform to LBCTestKitConfiguratorProtocol
    init(configurator: LBCTestKitConfiguratorProtocol)
}
