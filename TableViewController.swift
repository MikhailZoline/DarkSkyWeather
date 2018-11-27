//
//  TableViewController.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let networkManager: NetworkManager = NetworkManager.sharedInstance
    var weatherArray: [dailySummary] = [dailySummary]()
    var operationQueue: OperationQueue = OperationQueue()
    
    @IBOutlet var myTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        operationQueue.qualityOfService = .userInteractive
        let operation = BlockOperation(block: {[weak self] in
            self!.networkManager.getDailyWeather { (weatherArray,error) in
                if ((error) != nil) {
                        fatalError("Failed to Initialize JSON object \(error!.description)")
                    }
                OperationQueue.main.addOperation {[weak self] in
                    self?.weatherArray = weatherArray!
                    self?.tableView.reloadData()
                }
            }
        })
        operationQueue.addOperation(operation)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 500
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherArray.count
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWeatherCell", for: indexPath)
    
        configureCell(cell: cell as! TableViewCell, atIndexPath: indexPath)
        
        return cell
    }
 
    func configureCell(cell: TableViewCell, atIndexPath indexPath: IndexPath) {
        let summary: dailySummary? = self.weatherArray[indexPath.row]
        
        if let time: Int = summary?.time {
            let date = Date(timeIntervalSince1970:TimeInterval(time))
            cell.dateLabel?.text = self.dateFormatter.string(from: date)
        }
        if let summaryString: String = summary?.summary{
            cell.summaryLabel.text = "\(summaryString) The hight is \(Int((summary?.temperatureHigh)!)) and the low is \(Int((summary?.temperatureLow)!)). There is a \(Int((summary?.precipProbability)! * 100))% of precipitation."
        }
    }
    
    
    //     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
