//
//  LBCDatePickerDateAndTimeTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 10/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest
import UIKit

final class LBCDatePickerDateAndTimeTester {
    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCDatePickerDateAndTimeTester.getDatePicker(with: identifier, in: context)
    }

    private static func getDatePicker(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let datePicker = context.datePickers[identifier].firstMatch
        XCTAssertTrue(datePicker.waitForExistence(timeout: LBCTestTimeout.integration), "DatePicker with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return datePicker
    }
}

extension LBCDatePickerDateAndTimeTester {
    private func move(toValue value: String, fromPickerWheelIndex index: Int) {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        pickerWheel.adjust(toPickerWheelValue: value)
    }
    /**
     Validate pickerView hour
     - parameter: value -> time value (hour or minutes)
     - pickerWheelIndex : index of the pickerWheel
     */
    private func validateHour(value: String, at pickerWheelIndex: Int) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: pickerWheelIndex)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker time string value".logTaggedWithEmoji()) // hour format : 15 o'clock or 15 min
            XCTAssertEqual(pickerValue, value, "DatePicker time value \"\(pickerValue)\" does not equal to \"\(value)\".".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    /**
     Validate pickerView time
     - parameter: value -> time value (date time or pm value)
     - pickerWheelIndex : index of the pickerWheel
     */
    private func validateTime(value: String, at pickerWheelIndex: Int) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: pickerWheelIndex)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker time string value".logTaggedWithEmoji())
            XCTAssertEqual(pickerValue, value, "DatePicker time value \(pickerValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }
}

extension LBCDatePickerDateAndTimeTester: LBCDatePickerDateAndTimeTesterProtocol {
    func move(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .date(let value):
            self.move(toValue: value, fromPickerWheelIndex: 0)
        case .hour(let value):
            self.move(toValue: "\(value)", fromPickerWheelIndex: 1)
        case .minutes(let value):
            let moveValue = String(format: "%02d", value)
            self.move(toValue: moveValue, fromPickerWheelIndex: 2)
        case .meridiem(let value):
            self.move(toValue: value.rawValue, fromPickerWheelIndex: 3)
        default:
            XCTFail("Unknown date component type".logTaggedWithEmoji())
        }
        return self
    }

    func validate(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .date(let value):
            self.validateTime(value: value, at: 0)
        case .hour(let value):
            self.validateHour(value: "\(value) o’clock", at: 1)
        case .minutes(let value):
            self.validateHour(value: String(format: "%02d minutes", value), at: 2)
        case .meridiem(let value):
            self.validateTime(value: value.rawValue, at: 3)
        default:
            XCTFail("Unkwnown component type \(componentType)".logTaggedWithEmoji())
        }
        return self
    }
}
