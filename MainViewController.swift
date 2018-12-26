//
//  TableViewController.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MainViewController: UITableViewController, LocationManagerDelegate  {
    
    let networkManager: NetworkManager = NetworkManager.sharedInstance
    var weatherArray: [daily] = [daily]()
    var currently: currently?
    var operationQueue: OperationQueue = OperationQueue()
    var headerCell: MainHeaderCell?
    
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
        self.tableView.tableHeaderView = UIView()//
        self.tableView.contentInsetAdjustmentBehavior = .scrollableAxes
        self.headerCell = self.tableView.dequeueReusableCell(withIdentifier: "myLocationCell") as? MainHeaderCell
        self.tableView.sectionHeaderHeight = (headerCell?.bounds.height)!
    }
    
    
    func titleLocationUpdated() {
        OperationQueue.main.addOperation {[weak self] in
            self!.headerCell?.locationLabel.text = LocationManager.sharedInstance.currentLocation
            let location = LocationManager.sharedInstance.location
            let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
            
            let region: MKCoordinateRegion =  MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self!.headerCell?.mapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            self!.headerCell?.mapView.addAnnotation(annotation)
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
                    self!.headerCell?.summaryLabel.text = self?.currently!.summary
                    self!.headerCell?.temperatureLabel.text = "Temperature \(Int((self?.currently?.temperature)!)) F"
                    self!.headerCell?.windLabel.text = "Wind \((self?.currently?.wind)!)"
                    self!.headerCell?.humidityLabel.text = "Humidity \(Int((self?.currently?.humidity)!*100))%"
                    self?.tableView.reloadData()
                }
            }
        })
        operationQueue.addOperation(operation)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  view = UIView()
        view.addSubview(self.headerCell!)
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mySummaryCell", for: indexPath) as? DaySummaryCell

        configureCell(cell: cell!, atIndexPath: indexPath)

        return cell!
    }
 
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
        if cell.isKind(of: DaySummaryCell.self){
            let summary: daily? = self.weatherArray[indexPath.row]
            if let _: Int = summary?.time {
                (cell as! DaySummaryCell).dateLabel?.text = summary?.weekDay
            }
            if let summaryString: String = summary?.summary{
                (cell as! DaySummaryCell).summaryLabel.text = "\(summaryString) The highest is expected at \(Int((summary?.temperatureHigh)!))F and the lowest at \(Int((summary?.temperatureLow)!))F. There is a \(Int((summary?.precipProbability)! * 100))% chance of \(String(summary?.precipType == nil ? "precipitations" : (summary?.precipType!)!))."
            }
            if let iconString: String =  summary?.icon{
                (cell as! DaySummaryCell).iconImage.image = UIImage(named: iconString)
            }
        }
        else {
            
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
 
//    static var formatter: DateFormatter? = nil

//    var dateFormatter: DateFormatter = { () -> DateFormatter in
//        if (formatter == nil) {
//            formatter = DateFormatter()
//            formatter?.locale = Locale(identifier: "US_en")
//            formatter?.timeStyle = .none
//            formatter?.dateFormat = "MM/dd/yy"
//        }
//        return formatter!
//    }()
}
