//
//  DetailViewController.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/29/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class DetailViewControllerFunctions: NSObject{
    
    class func degToCompass( bearing : Double) ->String{
        let dirArr = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
        let val = Int(bearing/22.5 + 0.5)
        return dirArr[val]
    }
    
}

class DetailViewController: UITableViewController {
    
    
    static var cellDict: Array<((String, String), (String, String))> = [ (("SUNRISE","sunriseTime"),("SUNSET","sunsetTime")), (("CHANCE OF","precipProbability"),("HUMIDITY","humidity")), (("WIND","windSpeed"),("DIRECTION","degToCompass!")), (("VISIBILITY","visibility"),("PRESSURE","pressure"))]
    
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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section > 0 ? 3 : 1
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
                (cell as! DetailViewCellDate).dateLabel?.text = self.dateFormatter.string(from: date)
            }
        }
        if (cell is DetailViewCell ){
            (cell as! DetailViewCell).firstColumnNameLabel.text = indexPath.row == 1 ? summary?.precipType.uppercased() : getColumnName(row: indexPath.row, column: 0)
            (cell as! DetailViewCell).secondColumnNameLabel.text = getColumnName(row: indexPath.row, column: 1)
            let varPath = getVariableName(row: indexPath.row, column: 1)!
            if (varPath.last == "!")
            {
                let aSelector : Selector = #selector(self.degToCompass(bearing:) as (Double) -> String )
                let str : AnyObject? = self.perform(aSelector, with: summary?.windBearing) as AnyObject
                (cell as! DetailViewCell).secondColumnValueLabel.text = str as? String
                    //degToCompass(bearing: (summary?.windBearing)!)
            }
            else{
                (cell as! DetailViewCell).firstColumnValueLabel.text = {
                    let m = Mirror(reflecting: summary!)
                    return m.children.first { $0.label == varPath }?.value as? String
                }()
            }
//        if let summaryString: String = summary?.summary{
//            cell.summaryLabel.text = "\(summaryString) The highest is expected at \(Int((summary?.temperatureHigh)!))F and the lowest at \(Int((summary?.temperatureLow)!))F. There is a \(Int((summary?.precipProbability)! * 100))% chance of \(summary?.precipType as! String)."
//        }
//        if let iconString: String =  summary?.icon{
//            cell.iconImage.image = UIImage(named: iconString)
//        }
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
    
    @objc func degToCompass( bearing : Double) ->String{
        let dirArr = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
        let val = Int(bearing/22.5 + 0.5)
        return dirArr[val]
    }
    
    static var formatter: DateFormatter? = nil
    
    var dateFormatter: DateFormatter = { () -> DateFormatter in
        if (formatter == nil) {
            formatter = DateFormatter()
            formatter?.locale = Locale(identifier: "US_en")
            formatter?.timeStyle = .none
            formatter?.dateFormat = "EEEE, MMM d"
        }
        return formatter!
    }()

}
