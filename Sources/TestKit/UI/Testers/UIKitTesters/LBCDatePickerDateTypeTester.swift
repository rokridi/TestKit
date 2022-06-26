//
//  LBCDatePickerDateTypeTester.swift
//  LBCTestKit
//
//  Created by Aliou SARR on 12/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit
import XCTest

fileprivate enum PickerWheelType {
    case day
    case month
    case year
}

final class LBCDatePickerDateTypeTester: NSObject {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCDatePickerDateTypeTester.getDatePicker(with: identifier, in: context)
    }

    private static func getDatePicker(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let datePicker = context.datePickers[identifier].firstMatch
        XCTAssertTrue(datePicker.waitForExistence(timeout: LBCTestTimeout.integration), "DatePicker with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return datePicker
    }
}

extension LBCDatePickerDateTypeTester {
    private func validate(day value: Int, fromPickerWheelIndex index: Int) {
        do {
            let pickerValue = try self.getPickerWheelValue(at: index)
            let dayIntValue = try XCTUnwrap(Int(pickerValue), "Failed do get cast datePicker day value to int".logTaggedWithEmoji())
            XCTAssertEqual(dayIntValue, value, "DatePicker day value \(dayIntValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap date picker day value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func validate(month value: String, fromPickerWheelIndex index: Int) {
        do {
            let pickerValue = try self.getPickerWheelValue(at: index)
            XCTAssertEqual(pickerValue, value, "DatePicker month value \(pickerValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap date picker month value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func validate(year value: Int, fromPickerWheelIndex index: Int) {
        do {
            let pickerValue = try self.getPickerWheelValue(at: index)
            let yearIntValue = try XCTUnwrap(Int(pickerValue), "Failed do get cast datePicker year value to int".logTaggedWithEmoji())
            XCTAssertEqual(yearIntValue, value, "DatePicker year value \(yearIntValue) does not equal to \(value).".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap date picker year value. Error : \(error).".logTaggedWithEmoji())
        }
    }

    private func move(to value: String, fromPickerWheelIndex index: Int) {
        let picker = self.element
        let pickerWheel = picker.pickerWheels.element(boundBy: index)
        pickerWheel.adjust(toPickerWheelValue: value)
    }

    private func getPickerWheelValue(at index: Int) throws -> String {
        let datePicker = self.element
        let pickerWheel = datePicker.pickerWheels.element(boundBy: index)
        do {
            let pickerValue = try XCTUnwrap(pickerWheel.value as? String, "Failed do get datePicker string value".logTaggedWithEmoji())
            return pickerValue
        } catch let error {
            XCTFail("Failed to unwrap date picker value. Error : \(error).".logTaggedWithEmoji())
            return ""
        }
    }

    // This return the index of the wheel we need depend of param (day-month-year)
    // Depend of the local the month wheek can be at first or sedond position
    // For example in french local = 14 Janvier
    // In US Locale = 14 January
    private func getPickerWheelIndex(forType type: PickerWheelType, withValue value: String) throws -> Int {
        let formatter = DateFormatter()
        // get the months list
        let monthSymbols = try XCTUnwrap(formatter.monthSymbols)
        switch type {
        case .day:
            // get picker value
            let pickerValue = try self.getPickerWheelValue(at: 0)

            // check if the first pickerWheel value is a month
            // if true -> return index 1 because the first wheel contains month list and the second wheel contain day list
            // if false -> return the index 0
            if monthSymbols.contains(pickerValue) { return 1 }
            return 0
        case .month:
            // get picker value
            let pickerValue = try self.getPickerWheelValue(at: 0)
            // check if the first pickerWheel value is a month
            // if true -> return index 1 because is means that the first wheel contains days list and the second wheel contain month list
            // if false -> return the index 0
            if monthSymbols.contains(pickerValue) { return 0 }
            return 1
        case .year:
            return 2
        }
    }
}


extension LBCDatePickerDateTypeTester: LBCDatePickerDateTypeTesterProtocol {
    func move(_ componentType: LBCUIElementDateComponent) -> Self {
        do {
            switch componentType {
            case .day(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .day, withValue: String(value))
                move(to: "\(value)", fromPickerWheelIndex: pickerIndex)
            case .month(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .month, withValue: String(value))
                move(to: value, fromPickerWheelIndex: pickerIndex)
            case .year(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .year, withValue: String(value))
                move(to: "\(value)", fromPickerWheelIndex: pickerIndex)
            default:
                XCTFail("Unknown date component type".logTaggedWithEmoji())
            }
        } catch let error {
            XCTFail("Failed to get picker wheel index \(error)".logTaggedWithEmoji())
        }

        return self
    }

    func validate(_ componentType: LBCUIElementDateComponent) -> Self {
        do {
            switch componentType {
            case .day(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .day, withValue: String(value))
                self.validate(day: value, fromPickerWheelIndex: pickerIndex)
            case .month(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .month, withValue: String(value))
                self.validate(month: value, fromPickerWheelIndex: pickerIndex)
            case .year(let value):
                let pickerIndex = try self.getPickerWheelIndex(forType: .year, withValue: String(value))
                self.validate(year: value, fromPickerWheelIndex: pickerIndex)
            default:
                XCTFail("Unknown date component type".logTaggedWithEmoji())
            }
        } catch let error {
            XCTFail("Failed to get picker wheel index \(error)".logTaggedWithEmoji())
        }

        return self
    }
}
