//
//  TableViewCell.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/27/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var summaryLabel: MultilineLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class MultilineLabel : UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = bounds.width
        super.layoutSubviews()
    }
}
