//
//  ViewModel.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit
import Foundation

/**
 The purpose of the `ViewModelDelegate` is to pass the data via delegate.
 - didReceiveAirportData acts as delegate on success response
 - didFailed acts as the delegate error response.
 */
protocol ViewModelDelegate: class {
    func didReceiveAirportData()
    func didFailed()
}


class ViewModel: NSObject {
    
    weak var viewModelDelegate:ViewModelDelegate?
    var airportdata = [AirportData](){
        didSet{
            viewModelDelegate?.didReceiveAirportData()
        }
    }
    
    ///  Initialization for the view model to be setup
    override init() {
        super.init()

        ///Get the AirportData from the service api.
        WebServiceManager.sharedInstance.getData({ [unowned self] (response : [AirportData])  in
            self.airportdata = response
        }) { (error) in
            self.viewModelDelegate?.didFailed()
        }
    }
    
    /**
     Searches for and presence of a given string in the title of the given array.
     
     - parameter searchKeyword: String to search, must contain a value.
     - parameter resultsArray: Array to search, must hold MainArray types.
     - returns: Filtered array
     */
    func filterBySearchKeywords(searchKeyword: String, resultsArray : Array<AirportData>) -> Array<AirportData> {
        
        guard !searchKeyword.isEmpty else {
            return resultsArray
        }
        
        let filteredArray = resultsArray.filter({
            (result : AirportData) -> Bool in
            return (result.city?.localizedCaseInsensitiveContains(searchKeyword))!
        })
        
        return filteredArray
    }
    
    
}
