//
//  LBCUITesterProtocols.swift
//  LBCTestKit
//
//  Created by Luís Figueiredo on 20/04/2020.
//  Copyright © 2020 Leboncoin. All rights reserved.
//

import XCTest

// UI Elements specific protocols
public protocol LBCTestableValue {
    /// Validate the text value of an element
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self
}

// MARK: -
/// Conform to this protocol if you want to expose child element as a tester
public protocol LBCContentable: AnyObject {
    var content: LBCUIElementProvider { get }
}

extension LBCContentable where Self: LBCUIElementTester {
    var content: LBCUIElementProvider {
        return LBCUITester(context: self.element)
    }
}

// MARK: -
public protocol LBCActivityIndicatorTesterProtocol: AnyObject, LBCUIElementTester {}

// MARK: -
public protocol LBCAlertTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap on a element found by it's label in an UIAlertViewController
    /// - Parameter label: label of the element to tap on
    @discardableResult
    func tapOnAction(withLabel label: String) -> Self

    /// Validate the value of the element in an UIAlertViewController
    /// - Parameter element: element to test
    @discardableResult
    func validate(element: LBCAlertElementType) -> Self
}

// MARK: -
public protocol LBCActionSheetTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap on a element found by it's label in an action sheet UIAlertViewController
    /// - Parameter label: label of the element to tap on
    @discardableResult
    func tapOnAction(withLabel label: String) -> Self

    /// Validate the value of the element in an action sheet UIAlertViewController
    /// - Parameter element: element to test
    @discardableResult
    func validate(element: LBCActionSheetElementType) -> Self
}

// MARK: -
public protocol LBCButtonTesterProtocol: AnyObject, LBCUIElementTester, LBCTestableValue {
    /// Make a tap action on the Button
    @discardableResult
    func tap() -> Self

    /// Validate the state of the button
    /// - Parameter isEnable: state of the button
    @discardableResult
    func validate(isEnabled value: Bool) -> Self

    /// Validate the text value of the TexField
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self
}

// MARK: -
public protocol LBCCellTesterProtocol: LBCUIElementTester, LBCContentable {
    /// Delete a cell with a specific identifier
    /// - Parameters:
    ///   - text: Text used to get the delete button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func delete(withText text: String) -> Self

    /// Swipe and tap on an action of a cell specified by its text
    /// - Parameters:
    ///   - direction: The swipe direction
    ///   - text: Text used to get the action button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func swipe(_ direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self

    /// Make a tap on a specific cell
    @discardableResult
    func tap() -> Self

    /// Validate a cell with a specific label
    /// - Parameter label: the label to validate
    @discardableResult
    func validate(withLabel label: String) -> Self

    /// Validate a cell with a specific state
    /// - Parameter state: the state to validate
    @discardableResult
    func validate(state: LBCUIElementCellState) -> Self
}

// MARK: -
public protocol LBCCollectionViewTesterProtocol: AnyObject, LBCUIElementTester, LBCScrollableTesterProtocol {
    /// Drag and drop a cell from an index to an other index
    /// - Parameters:
    ///   - atIndex: the index of the cell to drag
    ///   - toIndex: the index of the cell to drop
    @discardableResult
    func dragAndDropCell(at atIndex: LBCUIElementIndex, to toIndex: LBCUIElementIndex) -> Self

    /// Drag and drop a cell from an identifier to an other identifier
    /// - Parameters:
    ///   - withIdentifier: the identifier of the cell to drag
    ///   - toIdentifier: the identifier of the cell to drop
    @discardableResult
    func dragAndDropCell(with withIdentifier: LBCUIElementIdentifier, to toIdentifier: LBCUIElementIdentifier) -> Self

    /// Swipe to a specific direction in a UICollectionView
    /// - Parameters:
    ///   - direction: the direction of the swipe
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self

    /// Make a tap on a specific cell found by it's index
    /// - Parameter index: the index of the cell
    @discardableResult
    func tapOnCell(at index: LBCUIElementIndex) -> Self

    /// Make a tap on a specific cell found by it's identifier
    /// - Parameter identifier: the identifier if the cell
    @discardableResult
    func tapOnCell(with identifier: LBCUIElementIdentifier) -> Self

    /// Validate the existence of a specific cell through it's index
    /// - Parameter identifier: the index of the cell
    @discardableResult
    func validateCellExistence(at index: LBCUIElementIndex) -> Self

    /// Validate the existence of a specific cell through it's identifier
    /// - Parameter identifier: the identifier of the cell
    @discardableResult
    func validateCellExistence(with identifier: LBCUIElementIdentifier) -> Self

    /// Validate the number of visibile cells un a UICollectionView
    /// - Parameter cellsCount: number of visible cells
    @discardableResult
    func validateVisibleCells(cellsCount: Int) -> Self
}

// MARK: -
public protocol LBCDatePickerDateAndTimeTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a move on a component type of the DatePickerDateAndTime
    /// - Parameter componentType: the component type to move
    @discardableResult
    func move(_ componentType: LBCUIElementDateComponent) -> Self

    /// Check pickerView value
    /// - Parameter componentType: datePicker wheel type
    @discardableResult
    func validate(_ componentType: LBCUIElementDateComponent) -> Self
}

// MARK: -
public protocol LBCDatePickerCountDownTimerTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a move on a component type of the DatePickerCountDownTimer
    /// - Parameter componentType: the component type to move
    @discardableResult
    func move(_ componentType: LBCUIElementDateComponent) -> Self

    /// Validate the component type of the DatePickerCountDownTimer
    /// - Parameter componentType: the component type to validate
    @discardableResult
    func validate(_ componentType: LBCUIElementDateComponent) -> Self
}

// MARK: -
public protocol LBCDatePickerDateTypeTesterProtocol: AnyObject, LBCUIElementTester {
    /// Move pickerView to specifc value
    /// - Parameter componentType: datePicker wheel type
    @discardableResult
    func move(_ componentType: LBCUIElementDateComponent) -> Self

    /// Check pickerView value
    /// - Parameter componentType: datePicker wheel type
    @discardableResult
    func validate(_ componentType: LBCUIElementDateComponent) -> Self
}

// MARK: -
public protocol LBCDatePickerTimeTesterProtocol: AnyObject, LBCUIElementTester {
    /// Move pickerView to specifc value
    /// - Parameter componentType: datePicker wheel type
    @discardableResult
    func move(_ componentType: LBCUIElementDateComponent) -> Self

    /// Check pickerView value
    /// - Parameter componentType: datePicker wheel type
    @discardableResult
    func validate(_ componentType: LBCUIElementDateComponent) -> Self
}

// MARK: -
public protocol LBCImageTesterProtocol: AnyObject, LBCUIElementTester {}

// MARK: -
public protocol LBCLabelTesterProtocol: AnyObject, LBCUIElementTester, LBCTestableValue {
    /// Validate the text value of the TexField
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self
}

// MARK: -
public protocol LBCMapTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a double tap on the Map
    @discardableResult
    func doubleTap() -> Self

    /// Sends a pinching gesture with two touches.
    /// - Parameters:
    ///   - withScale: the scale of the pinch gesture. Use a scale between 0 and 1 to "pinch close" or zoom out and a scale greater than 1 to "pinch open" or zoom in.
    ///   - velocity:  the velocity of the pinch in scale factor per second.
    @discardableResult
    func pinch(withScale: CGFloat, velocity: CGFloat) -> Self

    /// Swipe to a specific direction
    /// - Parameter direction: the direction of the swipe
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self
}

// MARK: -
public protocol LBCNavigationBarButtonTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap action on the NavigationBarButton
    @discardableResult
    func tap() -> Self

    /// Validate the text value of the NavigationBarButton
    /// - Parameter text: the text value to validate
    @discardableResult
    func validate(value text: String) -> Self
}

// MARK: -
public protocol LBCNavigationBarTesterProtocol: LBCUIElementTester, LBCContentable {
    /// Validate the title of the NavigationBar
    /// - Parameter text: the title value to validate
    @discardableResult
    func validate(title text: String) -> LBCNavigationBarTesterProtocol
}

// MARK: -
public protocol LBCPageIndicatorTesterProtocol: AnyObject, LBCUIElementTester {
    /// Validate the selected index in the PageIndicator
    /// - Parameter value: the index value to validate (start at 1)
    @discardableResult
    func validate(index value: Int) -> Self

    /// Validate the number of dots in the PageIndicator
    /// - Parameter value: number of items value (start at 1)
    @discardableResult
    func validate(numberItems value: Int) -> Self
}

// MARK: -
public protocol LBCPickerTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a move at a specific text in the Picker
    /// - Parameter value: the value where to move the Picker on
    @discardableResult
    func move(toTextValue value: String) -> Self

    /// Make a move at a specific text in the PickerView at a specific wheel index (available in iOS 13 only)
    /// - Parameter value: the value where to move the Picker on
    /// - Parameter index: the index of the picketView wheel
    @discardableResult
    func move(toTextValue value: String, atIndex index: Int) -> Self

    /// Validate the TextValue of the PickerView at a specific wheel index (available in iOS 13 only)
    /// - Parameter textValue: the text value to validate
    /// - Parameter index: the index of the picketView wheel
    @discardableResult
    func validate(textValue: String, atIndex index: Int) -> Self

    /// Validate the TextValue of the Picker
    /// - Parameter textValue: the text value to validate
    @discardableResult
    func validate(textValue: String) -> Self
}

// MARK: -
public protocol LBCProgressIndicatorTesterProtocol: AnyObject, LBCUIElementTester {
    /// Validate the value of the ProgressIndicator
    /// - Parameter value: the value to validate (between 0 and 1)
    @discardableResult
    func validate(progressValue value: Float) -> Self

    /// TODO - Add a setProgress function if needed. But it's seem not working for now
}

// MARK: -
public protocol LBCScrollBarTesterProtocol: AnyObject, LBCUIElementTester {}

// MARK: -
public protocol LBCScrollViewTesterProtocol: AnyObject, LBCUIElementTester, LBCScrollableTesterProtocol {
    /// Make a swipe action on a specific direction
    /// - Parameter direction: direction of the swipe action
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self
}

// MARK: -
public protocol LBCSearchBarTesterProtocol: AnyObject, LBCUIElementTester, LBCTestableValue {
    /// Clear the text of the textField of SearchBar
    @discardableResult
    func clearText() -> Self

    /// Fill the textField of SearchBar with a specific text
    /// - Parameter text: text to fill the textField of SearchBar
    @discardableResult
    func fill(with text: String) -> Self

    /// Validate the text value of the textField of SearchBar
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self

    /// Make the focus on the textField of SearchBar
    @discardableResult
    func focus() -> Self
}

// MARK: -
public protocol LBCSecuredTextFieldTesterProtocol: AnyObject, LBCUIElementTester {
    /// Clear the text of the TextField
    @discardableResult
    func clearText() -> Self

    /// Fill the TextField with a specific text
    /// - Parameter text: text to fill the TextField
    @discardableResult
    func fill(with text: String) -> Self
}

// MARK: -
public protocol LBCSegmentedControlTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap action on at a specific index
    /// - Parameter index: the index where to make a tap action
    @discardableResult
    func tap(at index: Int) -> Self

    /// Validate the selectionState at a specific index
    /// - Parameters:
    ///   - selectionState: the expected selection state
    ///   - index: the index where to check the selection state
    @discardableResult
    func validate(selectionState isSelected: Bool, at index: LBCUIElementIndex) -> Self

    /// Validate the textValue at a specific index
    /// - Parameters:
    ///   - value: the text value to validate
    ///   - index: the index of the text value to validate
    @discardableResult
    func validate(textValue value: String, at index: LBCUIElementIndex) -> Self
}

// MARK: -
public protocol LBCSliderTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a slide to a specific value on the UISlider
    /// - Parameter value: value to slide on
    @discardableResult
    func slide(toValue value: Double) -> Self

    /// Validate the value of the UISlider
    /// - Parameter value: expected value of the slider
    @discardableResult
    func validate(value: Double) -> Self
}

// MARK: -
public protocol LBCStepperTesterProtocol: AnyObject, LBCUIElementTester {
    /// Decrement the value of the UIStepper
    @discardableResult
    func decrement() -> Self

    /// Increment the value of the UIStepper
    @discardableResult
    func increment() -> Self

    /// Validate the given value of the UIStepper through a label who contains the value of the UIStepper
    /// - Parameter value: the value to validate
    @discardableResult
    func validate(value: Double, throughLabel labelIdentifier: LBCUIElementIdentifier) -> Self
}

// MARK: -
public protocol LBCSwitchTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make the toggle action on the Switch
    @discardableResult
    func toggle() -> Self

    /// Validate the state of the Switch
    /// - Parameter isOn: state of the switch
    @discardableResult
    func validate(state isOn: Bool) -> Self
}

// MARK: -
public protocol LBCTabBarItemTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap action on the TabBarItem
    @discardableResult
    func tap() -> Self

    /// Validate the selection state of the TabBarItem
    /// - Parameter state: the state to validate
    @discardableResult
    func validateState(isSelected state: Bool) -> Self

    /// Validate the text value of the TabBarItem
    /// - Parameter text: the text value to validate
    @discardableResult
    func validateText(value text: String) -> Self
}

// MARK: -
public protocol LBCTabBarTesterProtocol: AnyObject, LBCUIElementTester {}

// MARK: -
public protocol LBCTableViewTesterProtocol: AnyObject, LBCUIElementTester, LBCScrollableTesterProtocol {
    /// Delete a cell at a specific index
    /// - Parameters:
    ///   - index: the index of the cell to delete
    ///   - text: Text used to get the delete button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func deleteCell(at index: LBCUIElementIndex, withText text: String) -> Self

    /// Delete a cell with a specific identifier
    /// - Parameters:
    ///   - identifier: the index of the cell to delete
    ///   - text: Text used to get the delete button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func deleteCell(with identifier: LBCUIElementIdentifier, andText text: String) -> Self

    /// Reorder (move) a cell from an index to an other index
    /// - Parameters:
    ///   - atIndex: the index of the cell to reorder
    ///   - toIndex: the index where the other cell have to be moved
    @discardableResult
    func reorderCell(at atIndex: LBCUIElementIndex, to toIndex: LBCUIElementIndex) -> Self

    /// Reorder (move) a cell with an identifier to an other identifier
    /// - Parameters:
    ///   - withIdentifier: the identifier of the cell to reorder
    ///   - toIdentifier: the identifier where the other cell have to be moved
    @discardableResult
    func reorderCell(with withIdentifier: LBCUIElementIdentifier, to toIdentifier: LBCUIElementIdentifier) -> Self

    /// Swipe to a specific direction in a UICollectionView
    /// - Parameter direction: the direction of the swipe
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self

    /// Swipe on a cell and tap on an action
    /// - Parameters:
    ///   - index: the index of the cell
    ///   - direction: Swipe direction
    ///   - text: Text used to get the action button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func swipeOnCell(at index: LBCUIElementIndex, with direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self

    /// Swipe on a cell and tap on an action
    /// - Parameters:
    ///   - identifier: the identifier of the cell
    ///   - direction: Swipe direction
    ///   - text: Text used to get the action button (since there is no accessibilityIdentifier on UITableViewRowAction)
    @discardableResult
    func swipeOnCell(with identifier: LBCUIElementIdentifier, and direction: LBCUIElementCellSwipeDirection, andTapOnActionWithText text: String) -> Self

    /// Make a tap on a specific cell through it's index
    /// - Parameter index: the index of the cell
    @discardableResult
    func tapOnCell(at index: LBCUIElementIndex) -> Self

    /// Make a tap on a specific cell through it's identifier
    /// - Parameter identifier: the identifier of the cell
    @discardableResult
    func tapOnCell(with identifier: LBCUIElementIdentifier) -> Self

    /// Validate a cell with a specific label through it's index
    /// - Parameters:
    ///   - index: the index of the cell
    ///   - label: the label to check
    @discardableResult
    func validateCell(at index: LBCUIElementIndex, hasLabel label: String) -> Self

    /// Validate a cell with a specific label through it's identifier
    /// - Parameters:
    ///   - identifier: the identifier of the cell
    ///   - label: the label to check
    @discardableResult
    func validateCell(with identifier: LBCUIElementIdentifier, hasLabel label: String) -> Self

    /// Validate the existence of a specific cell through it's index
    /// - Parameter index: the index of the cell
    @discardableResult
    func validateCellExistence(at index: LBCUIElementIndex) -> Self

    /// Validate the existence of a specific cell through it's identifier
    /// - Parameter identifier: the identifier of the cell
    @discardableResult
    func validateCellExistence(with identifier: LBCUIElementIdentifier) -> Self

    /// Validate the number of the visible cells in a UITableView
    /// - Parameter cellsCount: the number of visible cells
    @discardableResult
    func validateVisibleCells(cellsCount: Int) -> Self
}

// MARK: -
public protocol LBCTextFieldTesterProtocol: AnyObject, LBCUIElementTester, LBCTestableValue {
    /// Clear the text of the TextField
    @discardableResult
    func clearText() -> Self

    /// Fill the TextField with a specific text
    /// - Parameter text: text to fill the TextField
    @discardableResult
    func fill(with text: String) -> Self

    /// Validate the text value of the TexField
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self

    /// Validate the text placeholder of the TexField
    /// - Parameter text: text placeholder to validate
    @discardableResult
    func validate(placeholder text: String) -> Self

    /// Make the focus on the TexField
    @discardableResult
    func focus() -> Self

    /// Validate the text format with a regex
    /// - Parameter regex: regex that the text must comply
    @discardableResult
    func validateFormat(with regex: String) -> Self
}

// MARK: -
public protocol LBCTextViewTesterProtocol: AnyObject, LBCUIElementTester, LBCTestableValue {
    /// Clear the text of the TextView
    @discardableResult
    func clearText() -> Self

    /// Fill the TextView with a specific text
    /// - Parameter text: text to fill the TextView
    @discardableResult
    func fill(with text: String) -> Self

    /// Validate the text value of the TextView
    /// - Parameter text: text value to validate
    @discardableResult
    func validate(value text: String) -> Self

    /// Make the focus on the TextView
    @discardableResult
    func focus() -> Self
}

// MARK: -
public protocol LBCToolbarButtonTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap action on the ToolbarButton
    @discardableResult
    func tap() -> Self

    /// Validate the text value of the ToolbarButton
    /// - Parameter text: the text value to validate
    @discardableResult
    func validate(value text: String) -> Self
}

// MARK: -
public protocol LBCToolbarTesterProtocol: AnyObject, LBCUIElementTester {}

// MARK: -
public protocol LBCViewTesterProtocol: LBCUIElementTester, LBCContentable {
    /// Make a double tap action on the View
    @discardableResult
    func doubleTap() -> Self

    /// Make a long press action with a specific duration on the View
    /// - Parameter duration: the duration of the long press action
    @discardableResult
    func press(forDuration duration: TimeInterval) -> Self

    /// Make a swipe action on a specific direction
    /// - Parameter direction: direction of the swipe action
    @discardableResult
    func swipe(to direction: LBCUIElementSwipeDirection) -> Self

    /// Make a tap action on the View
    @discardableResult
    func tap() -> Self

    /// Make a tap action configured with a specifi number of tap and finger touch
    /// - Parameters:
    ///   - numberOfTaps: number of taps to make
    ///   - numberOfTouches: number of finger touch to make the tap
    @discardableResult
    func tap(withNumberOfTaps numberOfTaps: Int, numberOfTouches: Int) -> Self

    /// Make a tap with two finger on the View
    @discardableResult
    func twoFingerTap() -> Self


    /// Check the view state
    /// - Parameters :
    ///   - state : the state to validate
    @discardableResult
    func validate(state: LBCUIElementViewState) -> Self

}

// MARK: -
public protocol LBCWebViewTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap on a specific lint text
    /// - Parameter onLinkText: the link where the tap will be make
    @discardableResult
    func tap(onLinkText: String) -> Self

    /// Validate the static text value of the WebView
    /// - Parameter value: static text value to validate
    @discardableResult
    func validate(staticText value: String) -> Self
}

// MARK: -
public protocol LBCLinkTesterProtocol: AnyObject, LBCUIElementTester {
    /// Make a tap on the link
    @discardableResult
    func tap(position: LBCUIElementTapPosition) -> Self

    /// Validate the label value of the link
    /// - Parameter text: label value to validate
    @discardableResult
    func validate(label text: String) -> Self
}

public extension LBCLinkTesterProtocol {
    @discardableResult
    func tap() -> Self {
        self.tap(position: .native)
    }
}
