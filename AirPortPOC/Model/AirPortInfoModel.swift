//
//  NewsModel.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import Foundation
import MapKit

var selectedLocation:CLLocation?

//{
//    "code": "AAA",
//    "lat": "-17.3595",
//    "lon": "-145.494",
//    "name": "Anaa Airport",
//    "city": "Anaa",
//    "state": "Tuamotu-Gambier",
//    "country": "French Polynesia",
//    "woeid": "12512819",
//    "tz": "Pacific\/Midway",
//    "phone": "",
//    "type": "Airports",
//    "email": "",
//    "url": "",
//    "runway_length": "4921",
//    "elev": "7",
//    "icao": "NTGA",
//    "direct_flights": "2",
//    "carriers": "1"
//}

class AirportData :  Codable{
    
    var code           : String?
    var lat            : String?
    var lon            : String?
    var name           : String?
    var city           : String?
    var state          : String?
    var country        : String?
    var woeid          : String?
    var tz             : String?
    var phone          : String?
    var type           : String?
    var email          : String?
    var url            : String?
    var runway_length  : String?
    var elev           : String?
    var icao           : String?
    var direct_flights : String?
    var carriers       : String?
    
    var distance: Double {
        get {
            if let latitude = lat ,let longitude = lon , let cityLocation = selectedLocation {
                return CLLocation(latitude: (latitude as NSString).doubleValue, longitude: (longitude as NSString).doubleValue).distance(from: cityLocation)
            }
            return 0
        }
    }
    
    public var coordinate: CLLocationCoordinate2D { get {
        let coordinate = CLLocationCoordinate2D(latitude:  (lat! as NSString).doubleValue, longitude: (lon! as NSString).doubleValue)
        return coordinate
        }
    }
}


