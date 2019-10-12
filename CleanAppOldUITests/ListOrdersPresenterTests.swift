//
//  ListOrdersPresenterTests.swift
//  CleanAppOldUI
//
//  Created by Ricardo Ruiz on 12/10/2019.
//  Copyright (c) 2019 Ricardo Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CleanAppOldUI
import XCTest

class ListOrdersPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListOrdersPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListOrdersPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListOrdersPresenter()
  {
    sut = ListOrdersPresenter()
  }
  
  // MARK: Test doubles
  
  class ListOrdersDisplayLogicSpy: ListOrdersDisplayLogic
  {
    var displayProductsCalled = false
    
    func DisplayProducts(viewModel: ListOrders.LoadProducts.ViewModel) {
        displayProductsCalled = true
    }
  }
  
  // MARK: Tests
  
  func testDisplayProducts()
  {
    // Given
    let spy = ListOrdersDisplayLogicSpy()
    sut.viewController = spy
    let response = ListOrders.LoadProducts.Response()
    
    // When
    sut.PresentProducts(response: response)
    
    // Then
    XCTAssertTrue(spy.displayProductsCalled, "displayProductsCalled(response:) should ask the view controller to display the result")
  }
}