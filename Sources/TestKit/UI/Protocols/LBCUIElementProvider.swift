//
//  LBCUIElementProvider.swift
//  LBCTestKit
//
//  Created by Pierre Abi-Aad on 18/02/2021.
//  Copyright © 2021 Leboncoin. All rights reserved.
//

import Foundation

public protocol LBCUIElementProvider {

    /// Get the tester protocol of an ActivityIndicator
    /// - Parameter identifier: the identifier of the ActivityIndicator
    @discardableResult
    func getActivityIndicator(with identifier: LBCUIElementIdentifier) -> LBCActivityIndicatorTesterProtocol

    /// Get the tester protocol of an Alert
    /// - Parameter identifier: the identifier of the Alert
    @discardableResult
    func getAlert(with identifier: LBCUIElementIdentifier) -> LBCAlertTesterProtocol

    /// Get the tester protocol of an Action Sheet
    @discardableResult
    func getActionSheet(with identifier: LBCUIElementIdentifier) -> LBCActionSheetTesterProtocol

    /// Get the tester protocol of a Button
    /// - Parameter identifier: the identifier of the Button
    @discardableResult
    func getButton(with identifier: LBCUIElementIdentifier) -> LBCButtonTesterProtocol

    /// Get the tester protocol of a CollectionView
    /// - Parameter identifier: the identifier of the CollectionView
    @discardableResult
    func getCollectionView(with identifier: LBCUIElementIdentifier) -> LBCCollectionViewTesterProtocol

    /// Get the tester protocol of a Cell
    /// - Parameter identifier: the identifier of the Cell
    @discardableResult
    func getCell(with identifier: LBCUIElementIdentifier) -> LBCCellTesterProtocol

    /// Get the tester protocol of a Cell
    /// - Parameter index: the index of the Cell
    @discardableResult
    func getCell(boundBy index: LBCUIElementIndex) -> LBCCellTesterProtocol

    /// Get the tester protocol of a DatePickerTypeCountdownTimer
    /// - Parameter identifier: the identifier of the DatePickerTypeCountdownTimer
    @discardableResult
    func getDatePickerTypeCountdownTimer(with identifier: LBCUIElementIdentifier) -> LBCDatePickerCountDownTimerTesterProtocol

    /// Get the tester protocol of a DatePickerTypeDate
    /// - Parameter identifier: the identifier of the DatePickerTypeDate
    @discardableResult
    func getDatePickerTypeDate(with identifier: LBCUIElementIdentifier) -> LBCDatePickerDateTypeTesterProtocol

    /// Get the tester protocol of a DatePickerTypeDateAndTime
    /// - Parameter identifier: the identifier of the DatePickerTypeDateAndTime
    @discardableResult
    func getDatePickerTypeDateAndTime(with identifier: LBCUIElementIdentifier) -> LBCDatePickerDateAndTimeTesterProtocol

    /// Get the tester protocol of a DatePickerTypeTime
    /// - Parameter identifier: the identifier of the DatePickerTypeTime
    @discardableResult
    func getDatePickerTypeTime(with identifier: LBCUIElementIdentifier) -> LBCDatePickerTimeTesterProtocol

    /// Get the tester protocol of an Image
    /// - Parameter identifier: the identifier of the Image
    @discardableResult
    func getImage(with identifier: LBCUIElementIdentifier) -> LBCImageTesterProtocol

    /// Get the tester protocol of a Label.
    /// ⚠️ Please note that as of Xcode 12.2.5, if you add a UITapGestureRecognizer on a UILabel, the XCTest framework will consider it as a UIButton.
    /// - Parameter identifier: the identifier of the Label
    @discardableResult
    func getLabel(with identifier: LBCUIElementIdentifier) -> LBCLabelTesterProtocol

    /// Get the tester protocol of a Map
    /// - Parameter identifier: the identifier of the Map
    @discardableResult
    func getMap(with identifier: LBCUIElementIdentifier) -> LBCMapTesterProtocol

    /// Get the tester protocol of a NavigationBar
    /// - Parameter identifier: the identifier of the NavigationBar
    @discardableResult
    func getNavigationBar(with identifier: LBCUIElementIdentifier) -> LBCNavigationBarTesterProtocol

    /// Get the tester protocol of a NavigationBarButton
    /// - Parameter identifier: the identifier of the NavigationBarButton
    @discardableResult
    func getNavigationBarButton(with identifier: LBCUIElementIdentifier) -> LBCNavigationBarButtonTesterProtocol

    /// Get the tester protocol of a PageIndicator
    /// - Parameter identifier: the identifier of the PageIndicator
    @discardableResult
    func getPageIndicator(with identifier: LBCUIElementIdentifier) -> LBCPageIndicatorTesterProtocol

    /// Get the tester protocol of a Picker
    /// - Parameter identifier: the identifier of the Picker
    @discardableResult
    func getPicker(with identifier: LBCUIElementIdentifier) -> LBCPickerTesterProtocol

    /// Get the tester protocol of a ProgressIndicator
    /// - Parameter identifier: the identifier of the ProgressIndicator
    @discardableResult
    func getProgressIndicator(with identifier: LBCUIElementIdentifier) -> LBCProgressIndicatorTesterProtocol

    /// Get the tester protocol of a ScrollBar
    /// - Parameter identifier: the identifier of the ScrollBar
    @discardableResult
    func getScrollBar(with identifier: LBCUIElementIdentifier) -> LBCScrollBarTesterProtocol

    /// Get the tester protocol of a ScrollView
    /// - Parameter identifier: the identifier of the ScrollView
    @discardableResult
    func getScrollView(with identifier: LBCUIElementIdentifier) -> LBCScrollViewTesterProtocol

    /// Get the tester protocol of a SearchBar
    /// - Parameter identifier: the identifier of the SearchBar
    @discardableResult
    func getSearchBar(with identifier: LBCUIElementIdentifier) -> LBCSearchBarTesterProtocol

    /// Get the tester protocol of a Secure TextField
    /// - Parameter identifier: the identifier of the TextField
    @discardableResult
    func getSecuredTextField(with identifier: LBCUIElementIdentifier) -> LBCSecuredTextFieldTesterProtocol

    /// Get the tester protocol of a SegmentedControl
    /// - Parameter identifier: the identifier of the SegmentedControl
    @discardableResult
    func getSegmentedControl(with identifier: LBCUIElementIdentifier) -> LBCSegmentedControlTesterProtocol

    /// Get the tester protocol of a Slider
    /// - Parameter identifier: the identifier of the Slider
    @discardableResult
    func getSlider(with identifier: LBCUIElementIdentifier) -> LBCSliderTesterProtocol

    /// Get the tester protocol of a Stepper
    /// - Parameter identifier: the identifier of the Stepper
    @discardableResult
    func getStepper(with identifier: LBCUIElementIdentifier) -> LBCStepperTesterProtocol

    /// Get the tester protocol of a Switch
    /// - Parameter identifier: the identifier of the Switch
    @discardableResult
    func getSwitch(with identifier: LBCUIElementIdentifier) -> LBCSwitchTesterProtocol

    /// Get the tester protocol of a TabBar
    /// - Parameter identifier: the identifier of the TabBar
    @discardableResult
    func getTabBar(with identifier: LBCUIElementIdentifier) -> LBCTabBarTesterProtocol

    /// Get the tester protocol of a TabBarItem
    /// - Parameter identifier: the identifier of the TabBarItem
    @discardableResult
    func getTabBarItem(with identifier: LBCUIElementIdentifier) -> LBCTabBarItemTesterProtocol

    /// Get the tester protocol of a TableView
    /// - Parameter identifier: the identifier of the TableView
    @discardableResult
    func getTableView(with identifier: LBCUIElementIdentifier) -> LBCTableViewTesterProtocol

    /// Get the tester protocol of a TextField
    /// - Parameter identifier: the identifier of the TextField
    @discardableResult
    func getTextField(with identifier: LBCUIElementIdentifier) -> LBCTextFieldTesterProtocol

    /// Get the tester protocol of a TextView
    /// - Parameter identifier: the identifier of the TextView
    @discardableResult
    func getTextView(with identifier: LBCUIElementIdentifier) -> LBCTextViewTesterProtocol

    /// Get the tester protocol of a Toolbar
    /// - Parameter identifier: the identifier of the Toolbar
    @discardableResult
    func getToolbar(with identifier: LBCUIElementIdentifier) -> LBCToolbarTesterProtocol

    /// Get the tester protocol of a ToolbarButton
    /// - Parameter identifier: the identifier of the ToolbarButton
    @discardableResult
    func getToolbarButton(with identifier: LBCUIElementIdentifier) -> LBCToolbarButtonTesterProtocol

    /// Get the tester protocol of a View
    /// - Parameter identifier: the identifier of the View
    @discardableResult
    func getView(with identifier: LBCUIElementIdentifier) -> LBCViewTesterProtocol

    /// Get the tester protocol of a WebView
    /// - Parameter identifier: the identifier of the WebView
    @discardableResult
    func getWebView(with identifier: LBCUIElementIdentifier) -> LBCWebViewTesterProtocol

    /// Get the tester protocol of a link
    /// - Parameter identifier: the identifier of the link
    @discardableResult
    func getLink(with identifier: LBCUIElementIdentifier) -> LBCLinkTesterProtocol
}
