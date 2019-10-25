//
//  ListOrdersUITests.swift
//  CleanAppOldUIUITests
//
//  Created by Ricardo Ruiz on 25/10/2019.
//  Copyright © 2019 Ricardo Ruiz. All rights reserved.
//

import XCTest

class ListOrdersUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments.append("--uitesting")

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadProducts() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app.launch()
        
        let product1 = app.tables.staticTexts["Product1"]
        let product2 = app.tables.staticTexts["Product2"]
        
        XCTAssertTrue(product1.exists)
        XCTAssertTrue(product2.exists)
    }

    func testRemoveFirstProduct() {
        app.launch()
        
        let product1 = app.tables.staticTexts["Product1"]
        let product2 = app.tables.staticTexts["Product2"]
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Product1"]/*[[".cells.staticTexts[\"Product1\"]",".staticTexts[\"Product1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["trailing0"]/*[[".buttons[\"Delete\"]",".buttons[\"trailing0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertTrue(!product1.exists)
        XCTAssertTrue(product2.exists)
    }
    
    func testAddProduct() {
        app.launch()
        
        XCUIApplication().tables.buttons["Add product"].tap()
        
        let newProduct = app.tables.staticTexts["New product"]
        XCTAssertTrue(newProduct.exists)
    }
    
    func testProductDetails() {
        app.launch()
        
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Product1"]/*[[".cells.staticTexts[\"Product1\"]",".staticTexts[\"Product1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let productDetails = app.staticTexts["Product1"]
        XCTAssertTrue(productDetails.exists)
        
    }
}
