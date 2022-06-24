//
//  LBCTestKitConfigurationObjectProtocol.swift
//  LBCTestKit
//
//  Created by Aliou.Sarr on 10/08/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

/// Protocol to use to pass configuration objects from LBCUITestCases to instances implementing LBCTestingConfiguratorProtocol
/// This protocol will replace LBCUITestsConfigurationProtocol from Definition
public protocol LBCTestKitConfigurationObjectProtocol: Codable {

}

public extension LBCTestKitConfigurationObjectProtocol {
    func encodeToBase64String() -> String? {
        return try? JSONEncoder().encode(self).base64EncodedString()
    }
    static func decode(from base64String: String) throws -> Self {
        guard let data = Data(base64Encoded: base64String) else { throw NSError(domain: "UITests", code: 1, userInfo: nil) }
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
