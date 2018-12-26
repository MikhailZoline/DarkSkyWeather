//
//  DetailViewController.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/29/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    
    static var cellDict: Array<((String, String), (String, String))> = [ (("SUNRISE","sunriseTime"),("SUNSET","sunsetTime")), (("CHANCE OF","precipProbability"),("HUMIDITY","humidity")), (("WIND","windSpeed"),("GUSTS","windGust")), (("VISIBILITY","visibility"),("PRESSURE","pressure"))]
    
    func getColumnName (row : Int, column: Int) -> String? {
        if column == 0{
            return DetailViewController.cellDict[row].0.0
        }
        if column == 1{
            return DetailViewController.cellDict[row].1.0
        }
        return nil
    }
    func getVariableName (row : Int, column: Int) -> String? {
        if column == 0{
            return DetailViewController.cellDict[row].0.1
        }
        if column == 1{
            return DetailViewController.cellDict[row].1.1
        }
        return nil
    }
    
    var summary: daily? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 500
        self.tableView.tableFooterView = UIView()
        self.navigationItem.title = LocationManager.sharedInstance.currentLocation
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section > 0 ? 4 : 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell()
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "myDateCell", for: indexPath)
            as! DayDetailCellDate
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "myDetailCell", for: indexPath)
                as! DayDetailCell
        }
        // Configure the cell...
        configureCell(cell: cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: AnyObject, atIndexPath indexPath: IndexPath) {

        if (cell is DayDetailCellDate ){
            if let _: Int = summary?.time {
                (cell as! DayDetailCellDate).dateLabel?.text = summary!.weekDay
                (cell as! DayDetailCellDate).summaryLabel?.text = summary!["summary"]
            }
        }
        else if (cell is DayDetailCell ){
            (cell as! DayDetailCell).firstColumnNameLabel.text = indexPath.row == 1 ? String(summary?.precipType == nil ? "precipitations".uppercased() : (summary?.precipType!.uppercased())!) : getColumnName(row: indexPath.row, column: 0)
            (cell as! DayDetailCell).secondColumnNameLabel.text = getColumnName(row: indexPath.row, column: 1)
            let varPath1 = getVariableName(row: indexPath.row, column: 0)!
            let varPath2 = getVariableName(row: indexPath.row, column: 1)!
            (cell as! DayDetailCell).firstColumnValueLabel.text = summary![varPath1]
            (cell as! DayDetailCell).secondColumnValueLabel.text = summary![varPath2]
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
}
