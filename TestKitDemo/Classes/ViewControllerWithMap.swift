//
//  ViewControllerWithMap.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit
import MapKit

final class ViewControllerWithMap: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "labelIdentifier"
        return label
    }()

    private lazy var resetLabelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reset", for: .normal)
        button.accessibilityIdentifier = "buttonIdentifier"
        button.addTarget(self, action: #selector(resetLabelAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLabel()
        self.addButton()
        self.addMap()
    }

    private func addLabel() {
        self.view.addSubview(self.label)
        self.label.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func addButton() {
        self.view.addSubview(self.resetLabelButton)
        self.resetLabelButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.resetLabelButton.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10).isActive = true
        self.resetLabelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.resetLabelButton.heightAnchor.constraint(equalTo: self.label.heightAnchor).isActive = true
    }

    private func addMap() {
        let mapView = MKMapView()
        mapView.accessibilityIdentifier = "mapIdentifier"
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        self.view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: self.label.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }

    @objc private func resetLabelAction() {
        self.label.text = "INITIAL REGION"
    }
}

extension ViewControllerWithMap: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if self.label.text != nil {
            label.text = "REGION DID CHANGE"
        } else {
            label.text = "INITIAL REGION"
        }
    }
}
