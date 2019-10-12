//
//  NewsDetailViewControllerTests.swift
//  NewsPOCTests
//
//  Created by Manjunath Kaliwal on 2/23/19.
//  Copyright © 2019 Manjunatha Kaliwal. All rights reserved.
//

import XCTest
@testable import NewsPOC

class NewsDetailViewControllerTests: XCTestCase {
     var detailVC: AirPortDetailViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(withIdentifier: "AirPortDetailViewController") as? AirPortDetailViewController
        
        //load view hierarchy
        _ = newsdetailVC.view
        
        XCTAssertNotNil(newsdetailVC.viewDidLoad(), "viewDidLoad method called")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



}
