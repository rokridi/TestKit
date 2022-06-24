//
//  LBCDatePickerTimeTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 09/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import XCTest

final class LBCDatePickerTimeTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCDatePickerTimeTester.getDatePicker(with: identifier, in: context)
    }

    private static func getDatePicker(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let datePicker = context.datePickers[identifier].firstMatch
        XCTAssertTrue(datePicker.waitForExistence(timeout: LBCTestTimeout.integration), "DatePicker with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return datePicker
    }
}

extension LBCDatePickerTimeTester {

    private func move(toValue value: String, fromPickerWheelIndex index: Int) {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        pickerWheel.adjust(toPickerWheelValue: value)
    }

    private func validate(hour value: String) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: 0)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker hour string value".logTaggedWithEmoji()) // hour format : 15 o'clock
            XCTAssertEqual(pickerValue, value, "DatePicker hour value \(pickerValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func validate(minutes value: String) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: 1)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker minutes string value".logTaggedWithEmoji()) // minutes format : 15 min
            XCTAssertEqual(pickerValue, value, "DatePicker minutes value \(pickerValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func validate(meridiemType type: LBCUIElementDateComponent.LBCMeridiemType) {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: 2)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker PM string value".logTaggedWithEmoji())
            XCTAssertEqual(pickerValue, type.rawValue, "DatePicker PM value \(pickerValue) does not equal to \(type.rawValue).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap picker value. Error : \(error).".logTaggedWithEmoji())
        }
    }
}

extension LBCDatePickerTimeTester: LBCDatePickerTimeTesterProtocol {
    func move(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .hour(let value):
            self.move(toValue: "\(value)", fromPickerWheelIndex: 0)
        case .minutes(let value):
            let moveValue = String(format: "%02d", value)
            self.move(toValue: moveValue, fromPickerWheelIndex: 1)
        case .meridiem(let value):
            self.move(toValue: value.rawValue, fromPickerWheelIndex: 2)
        default:
            XCTFail("Unkwnown component type".logTaggedWithEmoji())
        }
        return self
    }

    func validate(_ componentType: LBCUIElementDateComponent) -> Self {
        switch componentType {
        case .hour(let value):
            self.validate(hour: "\(value) o’clock")
        case .minutes(let value):
            self.validate(minutes: String(format: "%02d minutes", value))
        case .meridiem(let type):
            self.validate(meridiemType: type)
        default:
            XCTFail("Unkwnown component type \(componentType)".logTaggedWithEmoji())
        }
        return self
    }
}
