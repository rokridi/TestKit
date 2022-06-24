//
//  ViewControllerWithUIControl.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 19/04/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithUIControl: UIViewController {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [enableControl, disableControl, selectedControl])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private lazy var enableControl: UIControl = {
        let control: UIControl = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.widthAnchor.constraint(equalToConstant: 100).isActive = true
        control.heightAnchor.constraint(equalToConstant: 50).isActive = true
        control.backgroundColor = .red
        control.accessibilityIdentifier = "enableControldentifier"
        return control
    }()

    private lazy var disableControl: UIControl = {
        let control: UIControl = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.widthAnchor.constraint(equalToConstant: 100).isActive = true
        control.heightAnchor.constraint(equalToConstant: 50).isActive = true
        control.backgroundColor = .blue
        control.isEnabled = false
        control.accessibilityIdentifier = "disableControldentifier"
        return control
    }()

    private lazy var selectedControl: UIControl = {
        let control: UIControl = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.widthAnchor.constraint(equalToConstant: 100).isActive = true
        control.heightAnchor.constraint(equalToConstant: 50).isActive = true
        control.backgroundColor = .green
        control.isSelected = true
        control.accessibilityIdentifier = "selectedControldentifier"
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.createStackView()
    }

    private func createStackView() {
        self.view.addSubview(self.stackView)
        self.stackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
