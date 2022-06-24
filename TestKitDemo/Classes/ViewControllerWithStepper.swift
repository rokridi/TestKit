//
//  ViewControllerWithStepper.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 01/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithStepper: UIViewController {

    lazy var stepper: UIStepper = UIStepper()
    lazy var label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addStepper()
    }

    func addStepper() {
        self.stepper.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stepper)
        self.stepper.accessibilityIdentifier = "stepperIdentifier"
        self.stepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.stepper.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.stepper.addTarget(self, action: #selector(self.didChangeStepperValue(sender:)), for: .valueChanged)
        self.stepper.minimumValue = 0
        self.stepper.maximumValue = 100
        self.stepper.value = 10

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = String(stepper.value)
        self.view.addSubview(label)
        self.label.accessibilityIdentifier = "stepperLabelIdentifier"
        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.stepper.topAnchor, constant: -20).isActive = true
    }

    @objc
    private func didChangeStepperValue(sender: UIStepper) {
        self.label.text = String(sender.value)
        self.stepper.value = sender.value
    }
}
