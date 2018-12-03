//
//  LocationViewCell.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 12/2/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class LocationViewCell: UITableViewCell {
    
@IBOutlet var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
