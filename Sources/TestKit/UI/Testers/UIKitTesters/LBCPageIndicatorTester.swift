//
//  LBCPageIndicatorTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCPageIndicatorTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCPageIndicatorTester.getPageIndicator(with: identifier, in: context)
    }

    private static func getPageIndicator(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let pageIndicator = context.pageIndicators[identifier].firstMatch
        XCTAssertTrue(pageIndicator.waitForExistence(timeout: LBCTestTimeout.integration), "PageIndicator with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return pageIndicator
    }

    private func getIndexValuesArray(with value: String) throws -> [Int] {
        // element value is like 'page 1 of  2'
        // we want to get the two index value 1 and 2
        var indexValuesArray: [Int] = [] // [1,2]
        for character in value.components(separatedBy: CharacterSet.decimalDigits.inverted) {
            if !character.isEmpty {
                let indexValue = try XCTUnwrap(Int(character))
                indexValuesArray.append(indexValue)
            }
        }
        return indexValuesArray
    }
}

extension LBCPageIndicatorTester: LBCPageIndicatorTesterProtocol {
    func validate(index value: Int) -> Self {
        do {
            let stringValue: String = try XCTUnwrap(self.element.value as? String)
            let indexValuesArray = try self.getIndexValuesArray(with: stringValue)
            let selectIndex = Int(try XCTUnwrap(indexValuesArray.first))

            XCTAssertEqual(selectIndex, value, "PageIndicator index \"\(selectIndex)\" does not equal to \"\(value)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap PageIndicator index. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    func validate(numberItems value: Int) -> Self {
        do {
            let stringValue: String = try XCTUnwrap(self.element.value as? String)
            let indexValuesArray = try self.getIndexValuesArray(with: stringValue)
            let numberItems = Int(try XCTUnwrap(indexValuesArray.last))

            XCTAssertEqual(numberItems, value, "PageIndicator numberItems \"\(numberItems)\" does not equal to \"\(value)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap PageIndicator numberItems. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }


}
