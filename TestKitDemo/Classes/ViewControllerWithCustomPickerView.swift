//
//  ViewControllerWithCustomPickerView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithCustomPickerView: UIViewController {

    private let pickerViewDatasFirstItem = ["ITEM 1-1", "ITEM 1-2", "ITEM 1-3", "ITEM 1-4", "ITEM 1-5"]
    private let pickerViewDatasSecondItem = ["ITEM 2-1", "ITEM 2-2", "ITEM 2-3", "ITEM 2-4", "ITEM 2-5"]

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.accessibilityIdentifier = "customPickerView"
        return pickerView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupLayout()
    }

    private func setupLayout() {
        self.view.addSubview(self.pickerView)
        self.pickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.pickerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

extension ViewControllerWithCustomPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return self.pickerViewDatasFirstItem.count
        default:
            return self.pickerViewDatasSecondItem.count
        }
    }
}

extension ViewControllerWithCustomPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return self.pickerViewDatasFirstItem[row]
        default:
            return self.pickerViewDatasSecondItem[row]
        }
    }
}
