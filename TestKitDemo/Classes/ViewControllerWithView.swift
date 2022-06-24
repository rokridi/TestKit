//
//  ViewControllerWithView.swift
//  LBCTestKitDemo
//
//  Created by Aliou SARR on 11/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import UIKit

final class ViewControllerWithView: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gesture Type"
        label.accessibilityIdentifier = "labelIdentifier"
        return label
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [self.customView, self.subLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.accessibilityIdentifier = "stackViewIdentifier"
        return view
    }()

    private lazy var customView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "viewIdentifier"
        return view
    }()

    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sub Label"
        label.accessibilityIdentifier = "subLabelIdentifier"
        label.isUserInteractionEnabled = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addLabel()
        self.addStackViewView()
        self.addGestures()
    }

    private func addLabel() {
        self.view.addSubview(self.label)
        self.label.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    private func addStackViewView() {
        self.view.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 20).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.stackView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func addGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        customView.addGestureRecognizer(tapGesture)

        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapGestureAction(gesture:)))
        doubleTapGesture.numberOfTapsRequired = 2
        customView.addGestureRecognizer(doubleTapGesture)

        let tapMultipleTouchesGesture = UITapGestureRecognizer(target: self, action: #selector(tapMultiTouchesGestureAction(gesture:)))
        tapMultipleTouchesGesture.numberOfTouchesRequired = 3
        customView.addGestureRecognizer(tapMultipleTouchesGesture)

        let tapTwoFingerTouchesGesture = UITapGestureRecognizer(target: self, action: #selector(tapMultiTouchesGestureAction(gesture:)))
        tapTwoFingerTouchesGesture.numberOfTouchesRequired = 2
        customView.addGestureRecognizer(tapTwoFingerTouchesGesture)

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        customView.addGestureRecognizer(longPressGesture)

        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction(gesture:)))
        swipeLeftGesture.direction = .left
        customView.addGestureRecognizer(swipeLeftGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction(gesture:)))
        swipeRightGesture.direction = .right
        customView.addGestureRecognizer(swipeRightGesture)

        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction(gesture:)))
        swipeUpGesture.direction = .up
        customView.addGestureRecognizer(swipeUpGesture)

        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction(gesture:)))
        swipeDownGesture.direction = .down
        customView.addGestureRecognizer(swipeDownGesture)
    }

    // MARK: gestures action
    @objc private func doubleTapGestureAction(gesture: UITapGestureRecognizer) {
        self.label.text = "Double Tap Action"
    }

    @objc private func tapGestureAction(gesture: UITapGestureRecognizer) {
        self.label.text = "Simple Tap Action"
    }

    @objc private func tapMultiTouchesGestureAction(gesture: UITapGestureRecognizer) {
        self.label.text = "Tap Action with \(gesture.numberOfTouches) number of touches"
    }

    @objc private func longPressGestureAction(gesture: UILongPressGestureRecognizer) {
        self.label.text = "Long Press Action"
    }

    @objc private func swipeGestureAction(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .down:
            self.label.text = "Swipe Down Action"
        case .up:
            self.label.text = "Swipe Up Action"
        case .left:
            self.label.text = "Swipe Left Action"
        case .right:
            self.label.text = "Swipe Right Action"
        default:
            self.label.text = "Swipe Action Unknown direction"
        }
    }
}
