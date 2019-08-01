//
//  WeatherForecastViewController.swift
//  Weather
//
//  Created by Manoj Saini on 7/31/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

class WeatherForecastViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var timeFormatter : DateFormatter!
    var hourlyForecast : [HourlyData]! = []
    @IBOutlet weak var forecastBGImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherCell = UINib(nibName: kWeatherTableViewCell, bundle: nil)
        self.tableView.register(weatherCell, forCellReuseIdentifier:kWeatherTableViewCell)
        self.tableView.tableFooterView = UIView()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd, yyyy"
        self.title = dateFormatter.string(from: Date())
        
        timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh : mm a"
        timeFormatter.timeZone = TimeZone.current
        let calendar = Calendar.current
        self.hourlyForecast = DarkSkyConnection.shared.currentForeCast.hourly?.data?.filter({
            let date = Date(timeIntervalSince1970: TimeInterval($0.time!))
            return calendar.isDateInToday(date)
        })
        self.tableView.reloadData()
        let icon = DarkSkyEnum(rawValue: DarkSkyConnection.shared.currentForeCast.currently!.icon!)
        self.forecastBGImg.image = icon.getBGImage()
    }
}

extension WeatherForecastViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourlyForecast.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: kWeatherTableViewCell, for: indexPath) as! WeatherTableViewCell
        cell.selectionStyle = .none
        let data = hourlyForecast[indexPath.row]
        cell.timeLbl.text = timeFormatter.string(for: Date.init(timeIntervalSince1970: TimeInterval(data.time!)))
        let icon = DarkSkyEnum(rawValue: data.icon!)
        cell.forecastImg.image = icon.getImage()
        let tmp = (data.temperature! - 32)/1.8000
        cell.tempLbl.text = "\(Int(tmp))ºC"
        return cell
    }
}
