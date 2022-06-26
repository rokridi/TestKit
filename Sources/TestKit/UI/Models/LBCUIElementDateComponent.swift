//
//  LBCUIElementDateComponent.swift
//  LBCTestKit
//
//  Created by Pierre Abi-Aad on 18/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation

/// Enum use for the datePicker test.
/// each case represent datePicker Wheel type
public enum LBCUIElementDateComponent: Equatable {

    public enum LBCMeridiemType: String {
        case am = "AM"
        case pm = "PM"
    }

    /// Case for hour wheel
    /// - Parameter value: the hour's value
    case hour(value: Int)
    /// Case for minute wheel
    /// - Parameter value: the minute's value
    case minutes(value: Int)
    /// Case for day wheel
    /// - Parameter value: the day's number in month value (1 - 7)
    case day(value: Int)
    /// Case for month wheel
    /// - Parameter value: the month's value
    case month(value: String)
    /// Case for year wheel
    /// - Parameter value: the year's value
    case year(value: Int)
    /// Case for meridiem type wheel
    /// - Parameter value: meridiem value (PM or AM)
    case meridiem(type: LBCMeridiemType)
    /// Case date wheel for datePicker type dateAndTime
    /// - for a date validation set the new date format with [DayLabel] [DayNumber] conform to the how the pickerView display it (ex Jan 14 or 14 Jan)
    /// - for date update the date format must conform to the format display by the pickerView. Important not forget the comma after the day the date value. Exemple : Mon[,] 14 Jan
    /// - Parameter value: the date's value
    case date(value: String)
}
