//
//  WeatherViewController.swift
//  Weather
//
//  Created by Manoj Saini on 7/30/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tempTbl: UILabel!
    @IBOutlet weak var weatherForcastImg: UIImageView!
    @IBOutlet weak var weatherConditionLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var forecastBtn: UIButton!
    @IBOutlet weak var forecastBGImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tempTbl.isHidden = true
        self.weatherForcastImg.isHidden = true
        self.weatherConditionLbl.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMMM dd, yyyy"
        self.cityLbl.text = dateFormatter.string(from: Date())
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.getCurrentForecast()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    private func getCurrentForecast(){
        DarkSkyConnection.getCurrentTemperature { [weak self] (icon, temp, summary) in
            if let icon = icon, let temp = temp {
                self?.updateWeatherInfo(icon: icon, temp: temp, summary: summary!)
            }
        }
    }
    
    func updateWeatherInfo(icon : DarkSkyEnum, temp : Double, summary : String) {
        self.weatherForcastImg.image = icon.getImage()
        let tmp = (temp - 32)/1.8000
        self.tempTbl.text = "\(Int(tmp))ºC"
        self.forecastBGImg.image = icon.getBGImage()
        self.weatherConditionLbl.text = summary
        self.tempTbl.isHidden = false
        self.weatherForcastImg.isHidden = false
        self.weatherConditionLbl.isHidden = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
