//
//  LBCSliderTester.swift
//  LBCTestKit
//
//  Created by Damien Bannerot on 12/10/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

final class LBCSliderTester {

    private let context: XCUIElement
    var element: XCUIElement

    init(identifier: LBCUIElementIdentifier, in context: XCUIElement) {
        self.context = context
        self.element = LBCSliderTester.getSlider(with: identifier, in: context)
    }

    private static func getSlider(with identifier: LBCUIElementIdentifier, in context: XCUIElement) -> XCUIElement {
        let slider = context.sliders[identifier].firstMatch
        XCTAssertTrue(slider.waitForExistence(timeout: LBCTestTimeout.integration), "Slider with identifier \"\(identifier)\" does not exist.".logTaggedWithEmoji())
        return slider
    }
}

extension LBCSliderTester: LBCSliderTesterProtocol {
    @discardableResult
    func validate(value: Double) -> Self {
        let slider = self.element
        do {
            /// We need to convert the value returned by the slider in String because it is formatted like this: xx%
            var valueString = try XCTUnwrap(slider.value as? String, "Slider - failed to unwrap slider value in string".logTaggedWithEmoji())
            /// We removed the last character (%) of the string value
            valueString.removeLast()
            XCTAssertEqual(Double(valueString), value, "Slider - wrong expected slider value".logTaggedWithEmoji())
        } catch let error {
            XCTFail("Failed to unwrap slider value. Error : \(error)".logTaggedWithEmoji())
        }
        return self
    }

    @discardableResult
    func slide(toValue value: Double) -> Self {
        let slider = self.element
        slider.adjust(toNormalizedSliderPosition: CGFloat(value) / 100)
        return self
    }
}
