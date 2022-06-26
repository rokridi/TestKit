//
//  LBCUITester.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

public class LBCUITester {

    private var context: XCUIElement

    public init(context: XCUIElement) {
        self.context = context
    }

    /// Wait for a defined amount of time
    /// - Parameters:
    ///   - seconds: TimeInterval - the number of seconds to wait (ex: `1.0`)
    ///   - message: String - A message describing the waiting reason (ex: `"Wait for asynchronous task to perform"`)
    public func wait(for seconds: TimeInterval, message: String) {
        let waitExpectation = XCTestExpectation(description: message)
        let waiter = XCTWaiter.wait(for: [waitExpectation], timeout: seconds)

        guard waiter == .timedOut else {
            XCTFail("LBCUITester failed to wait for \(seconds) seconds.")
            return
        }
    }
}

// MARK: - LBCUIElementProvider

extension LBCUITester: LBCUIElementProvider {

    public func getTextField(with identifier: LBCUIElementIdentifier) -> LBCTextFieldTesterProtocol {
        return LBCTextFieldTester(identifier: identifier, in: self.context)
    }

    public func getTextView(with identifier: LBCUIElementIdentifier) -> LBCTextViewTesterProtocol {
        return LBCTextViewTester(identifier: identifier, in: self.context)
    }

    public func getSearchBar(with identifier: LBCUIElementIdentifier) -> LBCSearchBarTesterProtocol {
        return LBCSearchBarTester(identifier: identifier, in: self.context)
    }

    public func getLabel(with identifier: LBCUIElementIdentifier) -> LBCLabelTesterProtocol {
        return LBCLabelTester(identifier: identifier, in: self.context)
    }

    public func getButton(with identifier: LBCUIElementIdentifier) -> LBCButtonTesterProtocol {
        return LBCButtonTester(identifier: identifier, in: self.context)
    }

    public func getView(with identifier: LBCUIElementIdentifier) -> LBCViewTesterProtocol {
        return LBCViewTester(identifier: identifier, in: self.context)
    }

    public func getScrollView(with identifier: LBCUIElementIdentifier) -> LBCScrollViewTesterProtocol {
        return LBCScrollViewTester(identifier: identifier, in: self.context)
    }

    public func getCollectionView(with identifier: LBCUIElementIdentifier) -> LBCCollectionViewTesterProtocol {
        return LBCCollectionViewTester(identifier: identifier, in: self.context)
    }

    public func getTableView(with identifier: LBCUIElementIdentifier) -> LBCTableViewTesterProtocol {
        return LBCTableViewTester(identifier: identifier, in: self.context)
    }

    public func getCell(with identifier: LBCUIElementIdentifier) -> LBCCellTesterProtocol {
        return LBCCellTester(identifier: identifier, in: self.context)
    }

    public func getCell(boundBy index: LBCUIElementIndex) -> LBCCellTesterProtocol {
        return LBCCellTester(index: index, in: self.context)
    }

    public func getScrollBar(with identifier: LBCUIElementIdentifier) -> LBCScrollBarTesterProtocol {
        return LBCScrollBarTester(identifier: identifier, in: self.context)
    }

    public func getAlert(with identifier: LBCUIElementIdentifier) -> LBCAlertTesterProtocol {
        return LBCAlertTester(identifier: identifier, in: self.context)
    }

    public func getActionSheet(with identifier: LBCUIElementIdentifier) -> LBCActionSheetTesterProtocol {
        return LBCActionSheetTester(identifier: identifier, in: self.context)
    }

    public func getWebView(with identifier: LBCUIElementIdentifier) -> LBCWebViewTesterProtocol {
        return LBCWebViewTester(identifier: identifier, in: self.context)
    }

    public func getImage(with identifier: LBCUIElementIdentifier) -> LBCImageTesterProtocol {
        return LBCImageTester(identifier: identifier, in: self.context)
    }

    public func getMap(with identifier: LBCUIElementIdentifier) -> LBCMapTesterProtocol {
        return LBCMapTester(identifier: identifier, in: self.context)
    }

    public func getSlider(with identifier: LBCUIElementIdentifier) -> LBCSliderTesterProtocol {
        return LBCSliderTester(identifier: identifier, in: self.context)
    }

    public func getStepper(with identifier: LBCUIElementIdentifier) -> LBCStepperTesterProtocol {
        return LBCStepperTester(identifier: identifier, in: self.context)
    }

    public func getSwitch(with identifier: LBCUIElementIdentifier) -> LBCSwitchTesterProtocol {
        return LBCSwitchTester(identifier: identifier, in: self.context)
    }

    public func getDatePickerTypeCountdownTimer(with identifier: LBCUIElementIdentifier) -> LBCDatePickerCountDownTimerTesterProtocol {
        return LBCDatePickerCountDownTimerTester(identifier: identifier, in: self.context)
    }

    public func getDatePickerTypeTime(with identifier: LBCUIElementIdentifier) -> LBCDatePickerTimeTesterProtocol {
        return LBCDatePickerTimeTester(identifier: identifier, in: self.context)
    }

    public func getDatePickerTypeDate(with identifier: LBCUIElementIdentifier) -> LBCDatePickerDateTypeTesterProtocol {
        return LBCDatePickerDateTypeTester(identifier: identifier, in: self.context)
    }

    public func getDatePickerTypeDateAndTime(with identifier: LBCUIElementIdentifier) -> LBCDatePickerDateAndTimeTesterProtocol {
        return LBCDatePickerDateAndTimeTester(identifier: identifier, in: self.context)
    }

    public func getPicker(with identifier: LBCUIElementIdentifier) -> LBCPickerTesterProtocol {
        return LBCPickerTester(identifier: identifier, in: self.context)
    }

    public func getProgressIndicator(with identifier: LBCUIElementIdentifier) -> LBCProgressIndicatorTesterProtocol {
        return LBCProgressIndicatorTester(identifier: identifier, in: self.context)
    }

    public func getSegmentedControl(with identifier: LBCUIElementIdentifier) -> LBCSegmentedControlTesterProtocol {
        return LBCSegmentedControlTester(identifier: identifier, in: self.context)
    }

    public func getToolbar(with identifier: LBCUIElementIdentifier) -> LBCToolbarTesterProtocol {
        return LBCToolbarTester(identifier: identifier, in: self.context)
    }

    public func getToolbarButton(with identifier: LBCUIElementIdentifier) -> LBCToolbarButtonTesterProtocol {
        return LBCToolbarButtonTester(identifier: identifier, in: self.context)
    }

    public func getTabBar(with identifier: LBCUIElementIdentifier) -> LBCTabBarTesterProtocol {
        return LBCTabBarTester(identifier: identifier, in: self.context)
    }

    public func getTabBarItem(with identifier: LBCUIElementIdentifier) -> LBCTabBarItemTesterProtocol {
        return LBCTabBarItemTester(identifier: identifier, in: self.context)
    }

    public func getNavigationBar(with identifier: LBCUIElementIdentifier) -> LBCNavigationBarTesterProtocol {
        return LBCNavigationBarTester(identifier: identifier, in: self.context)
    }

    public func getNavigationBarButton(with identifier: LBCUIElementIdentifier) -> LBCNavigationBarButtonTesterProtocol {
        return LBCNavigationBarButtonTester(identifier: identifier, in: context)
    }

    public func getPageIndicator(with identifier: LBCUIElementIdentifier) -> LBCPageIndicatorTesterProtocol {
        return LBCPageIndicatorTester(identifier: identifier, in: self.context)
    }

    public func getSecuredTextField(with identifier: LBCUIElementIdentifier) -> LBCSecuredTextFieldTesterProtocol {
        return LBCSecuredTextFieldTester(identifier: identifier, in: self.context)
    }

    public func getLink(with identifier: LBCUIElementIdentifier) -> LBCLinkTesterProtocol {
        return LBCLinkTester(identifier: identifier, in: self.context)
    }

    public func getActivityIndicator(with identifier: LBCUIElementIdentifier) -> LBCActivityIndicatorTesterProtocol {
        return LBCActivityIndicatorTester(identifier: identifier, in: self.context)
    }
}
