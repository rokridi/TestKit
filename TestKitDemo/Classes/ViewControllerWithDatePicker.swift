//
//  ViewControllerWithDatePicker.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 04/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

fileprivate let dateString = "14/01/2021 15:30"

final class ViewControllerWithDatePicker: UIViewController {

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.createStackView()
        self.createCountdownDatePicker()
        self.createTimeDatePicker()
        self.createDateTypeDatePicker()
        self.createDateAndTimeDatePicker()
    }

    private func createStackView() {
        self.view.addSubview(self.stackView)
        self.stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    private func createCountdownDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        datePicker.datePickerMode = .countDownTimer
        if let date = dateFormatter.date(from: dateString) {
            datePicker.date = date
        }
        datePicker.accessibilityIdentifier = "datePickerCountDownTimerIdentifier"

        self.stackView.addArrangedSubview(datePicker)
    }

    private func createTimeDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .time
        if let date = dateFormatter.date(from: dateString) {
            datePicker.date = date
        }
        datePicker.accessibilityIdentifier = "datePickerTimeIdentifier"

        self.stackView.addArrangedSubview(datePicker)
    }

    private func createDateTypeDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .date
        if let date = dateFormatter.date(from: dateString) {
            datePicker.date = date
        }
        datePicker.accessibilityIdentifier = "datePickerDateTypeIdentifier"

        self.stackView.addArrangedSubview(datePicker)
    }

    private func createDateAndTimeDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }

        datePicker.datePickerMode = .dateAndTime
        if let date = dateFormatter.date(from: dateString) {
            datePicker.date = date
        }
        datePicker.accessibilityIdentifier = "datePickerDateAndTimeIdentifier"

        self.stackView.addArrangedSubview(datePicker)
    }
}
