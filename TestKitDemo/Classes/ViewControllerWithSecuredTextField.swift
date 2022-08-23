//
//  ViewControllerWithSecuredTextField.swift
//  LBCTestKitDemo
//
//  Created by Pierre A on 11/03/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithSecuredTextField: UIViewController {
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.textField, self.label])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.lightGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "textFieldIdentifier"
        textField.isHidden = false
        textField.isSecureTextEntry = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.delegate = self
        return textField
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "labelIdentifier"
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.addContentStackView()
    }

    private func addContentStackView() {
        self.view.addSubview(self.contentStackView)
        self.contentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.contentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.contentStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

extension ViewControllerWithSecuredTextField: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newValue = (currentText as NSString).replacingCharacters(in: range, with: string)
        self.label.text = newValue
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.label.text = ""
        return true
    }
}
