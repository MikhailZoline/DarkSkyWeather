//
//  DetailViewCell.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/29/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class DayDetailCellDate: UITableViewCell {
    
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
class DayDetailCell: UITableViewCell {
    
    @IBOutlet var firstColumnNameLabel: UILabel!
    @IBOutlet var firstColumnValueLabel: UILabel!
    @IBOutlet var secondColumnNameLabel: UILabel!
    @IBOutlet var secondColumnValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var formatter: DateFormatter? = nil
   
    var dateFormatter: DateFormatter = { () -> DateFormatter in
        if (formatter == nil) {
            formatter = DateFormatter()
            formatter?.locale = Locale(identifier: "US_en")
            formatter?.timeStyle = .none
            formatter?.dateFormat = "E, M dd" 
        }
        return formatter!
    }()
    
}
