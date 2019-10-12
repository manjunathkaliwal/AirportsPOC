//
//  DetailViewController.swift
//  AirPortPOC
//
//  Created by Manjunath Kaliwal on 10/11/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//


import UIKit

class AirPortDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var airportsTableView: UITableView!
    
    // MARK: Properties
    var getNearestAirports = [AirportData]()
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Registering the customCell with CityInfoTableViewCell.
        self.airportsTableView.register(UINib(nibName: String(describing: AirportsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: AirportsTableViewCell.self))

        /// listTableViewCell with default height.
        self.airportsTableView.estimatedRowHeight = CGFloat(Constants.kDetailsCellrowHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:-  UITableView Delegate Methods
extension AirPortDetailViewController: UITableViewDelegate {
    
    /// This is the description for a method.
    /// Returns: heightForRow.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /// This get the selected row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:-  UITableView DataSource Methods
extension AirPortDetailViewController: UITableViewDataSource {
    
    /// Returns: number of sections.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Returns: number of rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  self.getNearestAirports.count > Constants.kEmptyData {
            return (self.getNearestAirports.count)
        }
        
        return Constants.kEmptyData
    }
    
    /// Returns: This method returns the cell informations like city and country.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AirportsTableViewCell.self), for: indexPath) as! AirportsTableViewCell
        cell.configureCell(airportInfo: self.getNearestAirports[indexPath.row])
        return cell
    }
    
    
}
