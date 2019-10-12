//
//  AirPortTableViewCell.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var cityLabel: UILabel?
    @IBOutlet var countryLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(airportInfo: AirportData){
        if let city = airportInfo.city ,let countryname = airportInfo.country{
            cityLabel?.text = city
            countryLabel?.text = countryname
        }
    }
}
