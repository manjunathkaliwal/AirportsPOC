//
//  NewsTableViewCellTests.swift
//  NewsPOCTests
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import XCTest

@testable import NewsPOC

class NewsTableViewCellTests: XCTestCase {
    
    var listTableView = UITableView()
    var airportCell = AirPortTableViewCell()
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        listTableView.register(AirPortTableViewCell.self, forCellReuseIdentifier: "AirPortTableViewCell")
        airportCell.awakeFromNib()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    
    }
}
