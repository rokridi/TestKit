//
//  ViewControllerWithPicker.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithPicker: UIViewController {

    let values: [String]

    init(values: [String]) {
        self.values = values
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addPicker()
    }

    func addPicker() {
        let picker = UIPickerView()
        picker.accessibilityIdentifier = "pickerIdentifier"
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(picker)
        picker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        picker.selectRow(0, inComponent: 0, animated: true)
    }

}

extension ViewControllerWithPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.values.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.values[row]
    }
}
