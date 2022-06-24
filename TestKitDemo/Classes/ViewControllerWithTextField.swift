//
//  ViewControllerWithTextField.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 16/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithTextField: UIViewController {

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "textFieldIdentifier"
        textField.isHidden = false
        textField.backgroundColor = .lightGray
        textField.placeholder = "This is a placeholder"
        return textField
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.addTextField()
    }

    private func addTextField() {
        self.view.addSubview(self.textField)
        textField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }

}
