

//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Manoj Saini on 7/31/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

let kWeatherTableViewCell = "WeatherTableViewCell"
class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var forecastImg: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
