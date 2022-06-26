//
//  LBCTestTimeout.swift
//  LBCTestKit
//
//  Created by Pierre Abi-aad on 12/01/2022.
//  Copyright © 2022 Leboncoin. All rights reserved.
//

import Foundation

/// Must be used for waiting expectations
public struct LBCTestTimeout {
    /// 0.1
    public static let short: TimeInterval = 0.1

    /// 0.2
    public static let normal: TimeInterval = 0.2

    /// 0.4
    public static let long: TimeInterval = 0.4

    /// 3.0
    public static let integration: TimeInterval = 3.0
}
