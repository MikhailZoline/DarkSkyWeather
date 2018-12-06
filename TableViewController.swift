//
//  TableViewController.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
import CoreLocation

class TableViewController: UITableViewController, LocationManagerDelegate  {
    
    let networkManager: NetworkManager = NetworkManager.sharedInstance
    var weatherArray: [daily] = [daily]()
    var currently: currently?
    var operationQueue: OperationQueue = OperationQueue()
   
    @IBOutlet var myTableView : UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let locMan: LocationManager = LocationManager.sharedInstance
        locMan.ViewContollerDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 500
        self.tableView.tableFooterView = UIView()
    }
    
    func titleLocationUpdated() {
        OperationQueue.main.addOperation {[weak self] in
            self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 0 )], with: UITableView.RowAnimation.fade)
        }
    }
    
    func networkLocationUpdated() {
        operationQueue.qualityOfService = .userInteractive
        let operation = BlockOperation(block: {[weak self] in
            self!.networkManager.getDailyWeather { (currently, weatherArray,error) in
                if ((error) != nil) {
                    fatalError("Failed to Initialize JSON object \(error!.description)")
                }
                OperationQueue.main.addOperation {[weak self] in
                    self?.currently = currently
                    self?.weatherArray = weatherArray!
                    self?.tableView.reloadData()
                }
            }
        })
        operationQueue.addOperation(operation)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 1 : weatherArray.count
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = indexPath.section == 0 ? tableView.dequeueReusableCell(withIdentifier: "myLocationCell", for: indexPath) : tableView.dequeueReusableCell(withIdentifier: "mySummaryCell", for: indexPath)
        if indexPath.section == 1 {
            configureCell(cell: cell as! TableViewCell, atIndexPath: indexPath)
        }
        else{
            (cell as! LocationViewCell).locationLabel?.text = LocationManager.sharedInstance.currentLocation
        }
        return cell
    }
 
    func configureCell(cell: TableViewCell, atIndexPath indexPath: IndexPath) {
        let summary: daily? = self.weatherArray[indexPath.row]
        
        if let time: Int = summary?.time {
            let date = Date(timeIntervalSince1970:TimeInterval(time))
            cell.dateLabel?.text = self.dateFormatter.string(from: date)
        }
        if let summaryString: String = summary?.summary{
            cell.summaryLabel.text = "\(summaryString) The highest is expected at \(Int((summary?.temperatureHigh)!))F and the lowest at \(Int((summary?.temperatureLow)!))F. There is a \(Int((summary?.precipProbability)! * 100))% chance of \(summary?.precipType as! String)."
        }
        if let iconString: String =  summary?.icon{
            cell.iconImage.image = UIImage(named: iconString)
        }
    }
    
    
    //     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "ShowDetailController"){
            let indexPath: IndexPath  = self.tableView.indexPathForSelectedRow!
            let summary: daily? = self.weatherArray[indexPath.row]
            
            // Pass the selected book to the new view controller.
            let detailViewController: DetailViewController = (segue.destination as? DetailViewController)!
            detailViewController.summary = summary
        }
    }
 
    static var formatter: DateFormatter? = nil

    var dateFormatter: DateFormatter = { () -> DateFormatter in
        if (formatter == nil) {
            formatter = DateFormatter()
            formatter?.locale = Locale(identifier: "US_en")
            formatter?.timeStyle = .none
            formatter?.dateFormat = "MM/dd/yy"
        }
        return formatter!
    }()
}
