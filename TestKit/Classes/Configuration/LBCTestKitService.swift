//
//  LBCTestKitService.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 04/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

let TESTKIT_CONFIGURATION_KEY = "_TESTING_CONFIGURATION_"
let TESTKIT_CONFIGURATION_HOMEPAGE_KEY = "_TESTING_HOMEPAGE_"
let TESKIT_CONFIGURATION_OBJECT_KEY = "_TESTING_CONFIGURATION_OBJECT_"

class LBCTestKitService {

    private var configurator: LBCTestKitConfiguratorProtocol?
    private var configurationValue: String?
    private var configurationHomePageValue: String?
    private var configurationObjectValue: String?

    public required init(configurator: LBCTestKitConfiguratorProtocol) {
        self.configurator = configurator
        self.loadEnvironmentVariables()
    }

    private func loadEnvironmentVariables() {
        let dict = ProcessInfo.processInfo.environment

        let (config, homePage, configurationObject) = self.exactEnvironmentVariables(dict: dict)

        self.configurationValue = config
        self.configurationHomePageValue = homePage
        self.configurationObjectValue = configurationObject
    }

    private func exactEnvironmentVariables(dict: [String: String]) -> (String?, String?, String?) {
        let config = dict[TESTKIT_CONFIGURATION_KEY]
        let homePage = dict[TESTKIT_CONFIGURATION_HOMEPAGE_KEY]
        let configurationObject = dict[TESKIT_CONFIGURATION_OBJECT_KEY]

        return (config,
                homePage,
                configurationObject)
    }
}

extension LBCTestKitService: LBCTestKitServiceProtocol {
    // Return true if homepage is setted by testing configurator, if not return false
    public func applyTestingEnvironment() -> Bool {
        var returnValue: Bool = false

        guard let configurator = self.configurator else { return returnValue }

        switch (self.configurationHomePageValue, self.configurationValue, self.configurationObjectValue) {
        case let (homePage?, config?, configObject?):
            configurator.applyTestkitConfiguration(key: config)
            configurator.applyTestkitConfiguration(configuration: configObject, page: homePage)
            configurator.applyTestkitHomePage(key: homePage)
            returnValue = true
        case let (homePage?, config?, _):
            configurator.applyTestkitConfiguration(key: config)
            configurator.applyTestkitHomePage(key: homePage)
            returnValue = true
        case let (homePage?, _, configObject?):
            configurator.applyTestkitConfiguration(configuration: configObject, page: homePage)
            configurator.applyTestkitHomePage(key: homePage)
            returnValue = true
        case let (homePage?, _, _):
            configurator.applyTestkitHomePage(key: homePage)
            returnValue = true
        case let (_, config?, _):
            configurator.applyTestkitConfiguration(key: config)
        case (_, _, _):
            break
        }
        return returnValue
    }
}
