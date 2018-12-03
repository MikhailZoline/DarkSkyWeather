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
    
    var summary: dailySummary? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
            as! DetailViewCellDate
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "myDetailCell", for: indexPath)
                as! DetailViewCell
        }
        // Configure the cell...
        configureCell(cell: cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: AnyObject, atIndexPath indexPath: IndexPath) {

        if (cell is DetailViewCellDate ){
            if let time: Int = summary?.time {
                let date = Date(timeIntervalSince1970:TimeInterval(time))
                (cell as! DetailViewCellDate).dateLabel?.text = self.weekDayFormatter.string(from: date)
                (cell as! DetailViewCellDate).summaryLabel?.text = summary!["summary"]
            }
        }
        else if (cell is DetailViewCell ){
            (cell as! DetailViewCell).firstColumnNameLabel.text = indexPath.row == 1 ? summary?.precipType.uppercased() : getColumnName(row: indexPath.row, column: 0)
            (cell as! DetailViewCell).secondColumnNameLabel.text = getColumnName(row: indexPath.row, column: 1)
            let varPath1 = getVariableName(row: indexPath.row, column: 0)!
            let varPath2 = getVariableName(row: indexPath.row, column: 1)!
            (cell as! DetailViewCell).firstColumnValueLabel.text = summary![varPath1]
            (cell as! DetailViewCell).secondColumnValueLabel.text = summary![varPath2]
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    static var dayFormatter: DateFormatter? = nil
    
    var weekDayFormatter: DateFormatter = { () -> DateFormatter in
        if (dayFormatter == nil) {
            dayFormatter = DateFormatter()
            dayFormatter?.locale = Locale(identifier: "US_en")
            dayFormatter?.timeStyle = .none
            dayFormatter?.dateFormat = "EEEE, MMM d"
        }
        return dayFormatter!
    }()

}
