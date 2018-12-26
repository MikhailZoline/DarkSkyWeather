//
//  TableViewCell.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/27/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class DaySummaryCell: UITableViewCell {

    @IBOutlet var iconImage: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
