//
//  String+Extensions.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 17/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation

extension String {
    func logTaggedWithEmoji() -> String {
        return "🧨 \(self)"
    }

    ///
    /// Return a boolean to validate a regex pattern.
    ///
    /// - parameter pattern: the regex in string used for validation.
    /// - returns: true if the validation match with the regex provided, false otherwise.
    ///
    func validateRegexPattern(from pattern: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return false
        }
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }
}
