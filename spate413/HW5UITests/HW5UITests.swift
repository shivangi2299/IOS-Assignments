//
//  HW5UITests.swift
//  HW5UITests
//
//  Created by Rohan Panchal on 2/5/24.
//

import XCTest

final class HW5UITests: XCTestCase {

    // 1.A
    // Points: 10
    func testAllElementsExist() {

        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["My Shopping List"].exists)
        
        XCTAssertTrue(app.buttons["New Item"].exists)
        XCTAssertTrue(app.buttons["New List"].exists)
        XCTAssertTrue(app.buttons["Add"].exists)
        
        XCTAssertTrue(app.staticTexts["Description"].exists)
        XCTAssertTrue(app.staticTexts["Quantity"].exists)
        
        XCTAssertTrue(app.textFields["Description_Input"].exists)
        XCTAssertTrue(app.textFields["Quantity_Input"].exists)
        
        XCTAssertTrue(app.textViews["List_Output"].exists)
    }
    
    // 1.B
    // Points: 5
    func testDescriptionInputAllowsTextAndNumbers() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        
        XCTAssertTrue(app.keyboards.count > 0)
        
        // Type the number '1' and check for text field input value.
        app.textFields["Quantity_Input"].typeText("A")
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "A1")
    }
    
    // 1.C
    // Points: 5
    func testQuantityInputOnlyAllowsNumbers() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        
        XCTAssertTrue(app.keyboards.count > 0)
        
        // Type the number '1' and check for text field input value.
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "1")
    }
    
    // 1.D
    // Points: 10
    func testInputValidationSequence01() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Add"].tap()
        
        XCTAssertTrue(app.alerts["Error"].exists)
        XCTAssertTrue(app.staticTexts["Invalid Quantity"].exists)
    }
    
    // 1.E
    // Points: 10
    func testInputValidationSequence02() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("1")
        
        app.buttons["Add"].tap()
        
        XCTAssertTrue(app.alerts["Error"].exists)
        XCTAssertTrue(app.staticTexts["Invalid Description"].exists)
    }
    
    // 1.F
    // Points: 10
    func testInputSequence01() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "1")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Egg")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Egg")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n")
    }
    
    // 1.G
    // Points: 10
    func testInputSequence02() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "1")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Egg")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Egg")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n")
        
        app.buttons["New Item"].tap()
        
        XCTAssertEqual(app.textFields["Quantity_Input"].value as! String, "")
        XCTAssertEqual(app.textFields["Description_Input"].value as! String, "")
    }
    
    // 1.H
    // Points: 10
    func testInputSequence03() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "1")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Egg")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Egg")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n")
        
        app.buttons["New Item"].tap()
        
        XCTAssertEqual(app.textFields["Quantity_Input"].value as! String, "")
        XCTAssertEqual(app.textFields["Description_Input"].value as! String, "")
        
        // Second item
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("5")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "5")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Onions")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Onions")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n5x Onions\n")
        
        app.buttons["New Item"].tap()
        
        XCTAssertEqual(app.textFields["Quantity_Input"].value as! String, "")
        XCTAssertEqual(app.textFields["Description_Input"].value as! String, "")
    }
    
    // 1.H
    // Points: 10
    // Tests the clear functionality
    func testInputSequence04() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("1")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "1")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Egg")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Egg")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n")
        
        app.buttons["New Item"].tap()
        
        XCTAssertEqual(app.textFields["Quantity_Input"].value as! String, "")
        XCTAssertEqual(app.textFields["Description_Input"].value as! String, "")
        
        // Second item
        
        app.textFields["Quantity_Input"].tap()
        app.textFields["Quantity_Input"].typeText("5")
        
        XCTAssertTrue(app.textFields["Quantity_Input"].value as! String == "5")
        
        app.textFields["Description_Input"].tap()
        app.textFields["Description_Input"].typeText("Onions")
        
        XCTAssertTrue(app.textFields["Description_Input"].value as! String == "Onions")
        
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "1x Egg\n5x Onions\n")
        
        app.buttons["New Item"].tap()
        
        XCTAssertEqual(app.textFields["Quantity_Input"].value as! String, "")
        XCTAssertEqual(app.textFields["Description_Input"].value as! String, "")
        
        app.buttons["New List"].tap()
        
        XCTAssertEqual(app.textViews["List_Output"].value as! String, "")
        
    }
}
