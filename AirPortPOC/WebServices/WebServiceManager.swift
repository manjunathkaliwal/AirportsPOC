//
//  ServiceManager.swift
//  AirPortPOCTests
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit

/**
 The purpose of the `ServiceIdentifier` is identify the service identifier when multiple service being called
 */
public enum ServiceIdentifier {
    case getAirPortData
}

/**
 ServiceType to identify the type of the service being called.
 */
public enum ServiceType: String {
    case GET
    case POST
    case PUT
    case DELETE
}

class WebServiceManager{
    
    static let sharedInstance = WebServiceManager()
    
    func getData<T : Decodable>(_ completion: @escaping ([T])->(),
                      onError: @escaping (_ error:Error)->()) {
        
        let baseURL =  ServiceUrl.getNewsData
        let getNewsService = BaseService(serviceIdentifier: .getAirPortData, serviceType: .GET, serviceURL: baseURL)
        getNewsService.start(success: { (responseData) in
        
            do {
                let decoder = JSONDecoder()
                let datamodel = try decoder.decode([T].self, from:responseData as Data) //Decode JSON Response Data
                completion(datamodel)

            } catch {
                print(error.localizedDescription)
                onError(error)

            }
            
        }) { (error) in
            onError(error)
        }
        
    }
}

