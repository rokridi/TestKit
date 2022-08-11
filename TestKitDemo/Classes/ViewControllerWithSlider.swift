//
//  ViewControllerWithSlider.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 03/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithSlider: UIViewController {
    let step: Float = 10
    lazy var slider: UISlider = UISlider()
    lazy var label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSlider()
    }

    func addSlider() {
        self.slider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.slider)
        self.slider.accessibilityIdentifier = "sliderIdentifier"
        self.slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        self.slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        self.slider.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.slider.addTarget(self, action: #selector(self.didChangeSliderValue(sender:)), for: .valueChanged)
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.slider.value = 10.0
        self.slider.isContinuous = true

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = String(self.slider.value)
        self.view.addSubview(self.label)
        self.label.accessibilityIdentifier = "sliderLabelIdentifier"
        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.slider.topAnchor, constant: -20).isActive = true
    }

    @objc
    private func didChangeSliderValue(sender: UISlider) {
        let roundedStepValue = round(sender.value / self.step) * self.step
        sender.value = roundedStepValue
        self.label.text = String(sender.value)
    }

}
