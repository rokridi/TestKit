//
//  ViewControllerWithSegmentedControl.swift
//  LBCTestKitDemo
//
//  Created by Berangere LATOUCHE on 29/01/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithSegmentedControl: UIViewController {

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
        self.addSegmentedControl()
    }

    func addSegmentedControl() {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentedControl)
        segmentedControl.accessibilityIdentifier = "segmentedControlIdentifier"
        segmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        for (i, value) in self.values.enumerated() {
            segmentedControl.insertSegment(withTitle: value, at: i, animated: true)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

}
