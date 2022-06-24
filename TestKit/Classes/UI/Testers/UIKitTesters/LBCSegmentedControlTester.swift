//
//  LBCSegmentedControlTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCSegmentedControlTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCSegmentedControlTester.getSegmentedControl(with: identifier, in: context)
    }

    private static func getSegmentedControl(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let segmentedControl = context.segmentedControls[identifier].firstMatch
        XCTAssertTrue(segmentedControl.waitForExistence(timeout: LBCTestTimeout.integration), "SegmentedControl with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return segmentedControl
    }
}

extension LBCSegmentedControlTester: LBCSegmentedControlTesterProtocol {

    @discardableResult
    func validate(textValue value: String, at index: LBCUIElementIndex) -> Self {
        let segmentedControl = self.element
        XCTAssertEqual(segmentedControl.buttons.element(boundBy: index).label, value, "SegmentedControl - Wrong expected label at index".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func validate(selectionState isSelected: Bool, at index: LBCUIElementIndex) -> Self {
        let segmentedControl = self.element
        XCTAssertEqual(segmentedControl.buttons.element(boundBy: index).isSelected, isSelected, "SegmentedControl - Wrong item selected".logTaggedWithEmoji())
        return self
    }

    @discardableResult
    func tap(at index: Int) -> Self {
        let segmentedControl = self.element
        segmentedControl.buttons.element(boundBy: index).tap()
        return self
    }

}
