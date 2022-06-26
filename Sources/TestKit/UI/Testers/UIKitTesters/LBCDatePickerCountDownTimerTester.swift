//
//  LBCDatePickerCountDownTimerTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCDatePickerCountDownTimerTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCDatePickerCountDownTimerTester.getDatePicker(with: identifier, in: context)
    }

    private static func getDatePicker(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let datePicker = context.datePickers[identifier].firstMatch
        XCTAssertTrue(datePicker.waitForExistence(timeout: LBCTestTimeout.integration), "DatePicker with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return datePicker
    }
}

extension LBCDatePickerCountDownTimerTester {
    private func validate(value: String, fromPickerWheelIndex index: Int) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: index)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker string value".logTaggedWithEmoji())
            XCTAssertEqual(pickerValue, value, "DatePicker value \(pickerValue) at pickerWheel index \(index) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func move(toValue value: Int, fromPickerWheelIndex index: Int) {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        pickerWheel.adjust(toPickerWheelValue: "\(value)")
    }
}

extension LBCDatePickerCountDownTimerTester: LBCDatePickerCountDownTimerTesterProtocol {
    func move(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .hour(let value):
            self.move(toValue: value, fromPickerWheelIndex: 0)
        case .minutes(let value):
            self.move(toValue: value, fromPickerWheelIndex: 1)
        default:
            XCTFail("Unknown date component type".logTaggedWithEmoji())
        }
        return self
    }

    func validate(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .hour(let value):
            self.validate(value: "\(value) hours", fromPickerWheelIndex: 0)
        case .minutes(let value):
            self.validate(value: "\(value) min", fromPickerWheelIndex: 1)
        default:
            XCTFail("Unknown date component type".logTaggedWithEmoji())
        }
        return self
    }

}
