//
//  ViewController.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit

/**
 The purpose of the ViewController is to display the list of TopNews with title on the  UITableView.
 
 /// - Fetch the Data by making API call
 /// - Displaying the Airport list in the TableView like city and country.
 
 */


class AirportsListViewController: UIViewController,UISearchBarDelegate {
    
    // MARK: - Outlets
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var viewModel: ViewModel?
    var searchMode = false
    let searchBar = UISearchBar()
    var filteredSearchResultList : [AirportData]? = nil
    var listdataSource = [AirportData](){
        didSet {
            self.listTableView.reloadData()
        }
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure Search Bar
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        setUpUI()
        
    }
    
    // MARK: setUpUI
    func setUpUI() {
        
        /// TableView Header title
        //self.title = "Popular News"
        
        self.title = "TITLE".localized(withComment: "Screen Title")
        
        /// Registering the customCell with CityInfoTableViewCell.
        self.listTableView.register(UINib(nibName: String(describing: CityInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CityInfoTableViewCell.self))
        
        /// listTableViewCell with default height.
        self.listTableView.estimatedRowHeight = Constants.kListCellrowHeight
        
        /// ActivityIndicator start animating to show the info to webservice call.
        loadingIndicator.startAnimating()
        
        /// The ViewModel to make the service call to get the datasource
        self.viewModel = ViewModel()
        /// The Delegate method to get the service response.
        self.viewModel?.viewModelDelegate = self as ViewModelDelegate
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == String(describing: AirPortDetailViewController.self) ,let destination = segue.destination as? AirPortDetailViewController{
            destination.selectedIndex = (sender as! IndexPath).row
            destination.listdataSource = self.listdataSource
        }
    }
    
    // MARK: - Tap Action
    @IBAction func didTapSearchButtonItem(_ sender: Any) {
        
        if self.searchMode == true {
            searchBarCancelButtonClicked(self.searchBar)
            return
        }
        self.filteredSearchResultList = self.listdataSource
        self.searchMode = true
        self.listTableView.tableHeaderView = searchBar
        searchBar.sizeToFit()
        searchBar.becomeFirstResponder()
    }
    
    // MARK: - Search Bar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchMode = false
        searchBar.resignFirstResponder()
        self.listTableView.tableHeaderView = nil
        self.listTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredSearchResultList = viewModel?.filterBySearchKeywords(searchKeyword: searchText, resultsArray: self.listdataSource)
        self.listTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

//MARK:-  UITableView Delegate Methods
extension AirportsListViewController: UITableViewDelegate {
    
    /// This is the description for a method.
    /// Returns: heightForRow.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /// This get the selected row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: String(describing: AirPortDetailViewController.self), sender: indexPath)
    }
    
}

//MARK:-  UITableView DataSource Methods
extension AirportsListViewController: UITableViewDataSource {
    
    /// Returns: number of sections.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Returns: number of rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.searchMode && self.filteredSearchResultList != nil {
            return (self.filteredSearchResultList?.count)!
        }
        
        if self.searchMode == false && self.listdataSource.count > Constants.kEmptyData {
            return (self.listdataSource.count)
        }
        
        return Constants.kEmptyData
    }
    
    /// Returns: This method returns the cell informations like city and country.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityInfoTableViewCell.self), for: indexPath) as! CityInfoTableViewCell
        
        if self.searchMode && self.filteredSearchResultList != nil {
            cell.configureCell(airportInfo: self.filteredSearchResultList![indexPath.row])
        }
        
        if self.searchMode == false && self.listdataSource.count > Constants.kEmptyData {
            cell.configureCell(airportInfo: self.listdataSource[indexPath.row])
        }
        
        return cell
    }
    
    
}


//MARK: API Service Request and getting data from the viewModel
extension AirportsListViewController: ViewModelDelegate {
    
    /// This method gets call on successsful response
    /// - Returns: It recieves airportlist from the response.
    /// - Returns: Failed method gets call on empty airportlist.
    func didReceiveAirportData() {
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        if let airportdata = self.viewModel?.airportdata
        {
            self.listdataSource = airportdata
        }
    }
    
    /// Base Service Protocols are been implemented based on the error
    func didFailed(){
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        
        self.alert(message: "NO_INTERNET".localized(withComment: "NO_INTERNET"), title:"APP_NANE".localized(withComment: "APP_NANE"))
    }
    
}

extension UIViewController {
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK".localized(withComment: "OK"), style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


