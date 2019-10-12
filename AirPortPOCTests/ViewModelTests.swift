//
//  ViewModelTests.swift
//  NewsPOCTests
//
//  Created by Manjunath Kaliwal on 10/11/19
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import XCTest

@testable import NewsPOC


class ViewModelTests: XCTestCase {
        
    var viewModel: ViewModel?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       self.viewModel = ViewModel()
        
    }
    func testSearchFilterWithEmptyKeyword() {
        //Given an array and empty search string, the returned array should be same number of items.
        
        let array = viewModel?.filterBySearchKeywords(searchKeyword: "", resultsArray: [])
        
        XCTAssertEqual(array?.count, 0)
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
}
