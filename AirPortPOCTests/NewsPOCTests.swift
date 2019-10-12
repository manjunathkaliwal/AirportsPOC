//
//  NewsPOCTests.swift
//  NewsPOCTests
//
//  Created by Manjunath Kaliwal on 6/17/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import XCTest
@testable import NewsPOC

class NewsPOCTests: XCTestCase {
    var newsVC: NewsListViewController!

    var storyboard : UIStoryboard?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        newsVC = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as? NewsListViewController
        
        //load view hierarchy
        _ = newsVC.view
        
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        newsVC.NewsTableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        newsVC.NewsTableView.awakeFromNib()
        
        var dataSourceArray = [News]()
        
        let newsInfo1 = News()
        newsInfo1.title = "title1"
        newsInfo1.abstract = "subtitle1"
        newsInfo1.updated_date = "22-2-2017"
        newsInfo1.url = "imageurl"
        
        let newsInfo2 = News()
        newsInfo2.title = "title1"
        newsInfo2.abstract = "subtitle1"
        newsInfo2.updated_date = "22-2-2017"
        newsInfo2.url = "imageurl"
        
        dataSourceArray.append(newsInfo1)
        dataSourceArray.append(newsInfo2)
        
        newsVC.listdataSource = dataSourceArray
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(newsVC.NewsTableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(newsVC.NewsTableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(newsVC.conforms(to: UITableViewDelegate.self))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(newsVC.NewsTableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(newsVC.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(newsVC.responds(to: #selector(newsVC.numberOfSections(in:))))
        XCTAssertTrue(newsVC.responds(to: #selector(newsVC.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(newsVC.responds(to: #selector(newsVC.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = newsVC.tableView(newsVC.NewsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? NewsTableViewCell
        cell?.configureCell(newsInfo: newsVC.listdataSource[0])
        
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "NewsTableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testTableCellHasCorrectLabelText() {
        let cell0 = newsVC.tableView(newsVC.NewsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? NewsTableViewCell
        cell0?.configureCell(newsInfo: newsVC.listdataSource[0])
    }
    
    func testDidReceivedData()  {
        XCTAssertNotNil(newsVC.didReceiveNews(),"DidReceiveData Method not called")
    }
    
    func testDidReceivedDataFailed()  {
        XCTAssertNotNil(newsVC.didFailed(),"DidReceiveDataFaield Method not called")
    }
    
    func testDidReceiveMemoryWarning()  {
        XCTAssertNotNil(newsVC.didReceiveMemoryWarning(),"DidReceiveMemoryWarning Method not called")
    }
    
}
