//
//  Constants.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import Foundation
import UIKit

/// Constants to set the request timeout during service call.
public struct Constants {
    public static let kRequestTimeOut = 30
    public static let kListCellrowHeight: CGFloat = 70.0
    public static let kDetailsCellrowHeight: CGFloat = 125.0
    public static let kEmptyData  = 0
    
}

/// The purpose of the `ServiceUrl` is identify the type of the service URL being used for services
/// - Parameter: BaseURL Contains the base url
/// - Parameter: passTimes url
struct ServiceUrl {
    static let BaseURL = "https://gist.githubusercontent.com/"
    static let getNewsData = "tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
}

