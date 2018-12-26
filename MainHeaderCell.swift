//
//  MainHeaderCell.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 12/18/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
import MapKit

class MainHeaderCell: UITableViewCell {
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
