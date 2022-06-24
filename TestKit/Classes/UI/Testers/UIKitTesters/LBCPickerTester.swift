//
//  LBCPickerTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCPickerTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCPickerTester.getPicker(with: identifier, in: context)
    }

    private static func getPicker(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let picker = context.pickers[identifier].firstMatch
        XCTAssertTrue(picker.waitForExistence(timeout: LBCTestTimeout.integration), "Picker with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return picker
    }
}

extension LBCPickerTester: LBCPickerTesterProtocol {
    func validate(textValue: String, atIndex index: Int) -> Self {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        do {
            let pickerSelectValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get picker string value".logTaggedWithEmoji())
            XCTAssertEqual(pickerSelectValue, textValue, "Picker value \"\(pickerSelectValue)\" does not equal to \"\(textValue)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    func move(toTextValue value: String, atIndex index: Int) -> Self {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        pickerWheel.adjust(toPickerWheelValue: value)
        return self
    }

    @discardableResult
    func validate(textValue: String) -> Self {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: 0)
        do {
            let pickerSelectValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get picker string value".logTaggedWithEmoji())
            XCTAssertEqual(pickerSelectValue, textValue, "Picker value \"\(pickerSelectValue)\" does not equal to \"\(textValue)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
        return self
    }

    @discardableResult
    func move(toTextValue value: String) -> Self {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: 0)
        pickerWheel.adjust(toPickerWheelValue: value)
        return self
    }
}
