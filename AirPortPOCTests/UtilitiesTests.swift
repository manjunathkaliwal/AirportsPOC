//
//  UtilitiesTests.swift
//  NewsPOCTests
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import XCTest

@testable import NewsPOC


class UtilitiesTests: XCTestCase {
    
    func testSearchconvertToDict() {
        
        //Returns: Returns nil if json formate not input
        let dict = Utilities.convertToDict(data: nil)
        XCTAssertNil(dict)
    }
    
    func testsplitstring() {
        //To validate string is not empty
        let string = Utilities.splitstring(withstring:"2019-02-08T12:27:58-05:00")
        
        XCTAssertTrue(!string.isEmpty)
    }
    
    func testsplitstringlength() {
        //To validate string is not empty
        let string = Utilities.splitstring(withstring:"2019")
        
        XCTAssertTrue(string.isEmpty)
    }
    
    
    func testlocalized() {
        //To validate string is not empty
        let string = "TITLE".localized(withComment: "TITLE")
        
        XCTAssertTrue(!string.isEmpty)
    }
    
    
}
