//
//  AirportsTableViewCell.swift
//  AirPortPOC
//
//  Created by Vishnudas R, Vinay on 11/10/19.
//  Copyright © 2019 Manjunatha Kaliwal. All rights reserved.
//

import UIKit

class AirportsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var runawayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(airportInfo: AirportData){
        if let name = airportInfo.name ,let countryname = airportInfo.country{
            nameLabel?.text = name
            countryLabel?.text = countryname
        }
        
        if let runawayLength = airportInfo.runway_length {
            runawayLabel.text = "RUNAWAY_LENGTH".localized(withComment: "RUNAWAY_LENGTH") + runawayLength
        }
    }
}
