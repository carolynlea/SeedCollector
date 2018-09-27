//
//  ManyItemsCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit
import CoreLocation

class ManyItemsCell: UITableViewCell, CLLocationManagerDelegate
{
    //MARK: Properties
    
    private var locationManager: CLLocationManager!
    
    private var lat: Double?
    private var lon: Double?
    
    private let weatherGetter = WeatherGetter()
    
    //MARK: Outlets
    
    var sowingData: SowingData?
    {
        didSet
        {
            updateViews()
        }
    }
    @IBOutlet weak var growingCycleNameTextField: UITextField!
    @IBOutlet weak var sowingDateTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var methodTextField: UITextField!
    @IBOutlet weak var seedsSowedTextField: UITextField!
    
    private func updateViews()
    {
        guard let sowingData = sowingData else {return}
        
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, h:mm a"
        let dateString = dateFormatter.string(from: currentDate)
        
        growingCycleNameTextField.text = sowingData.cycleName
        sowingDateTextField.text = dateString
        temperatureTextField.text = sowingData.sowingTemp
        methodTextField.text = sowingData.method
        seedsSowedTextField.text = sowingData.numberOfSeedsSown
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        self.lon = userLocation.coordinate.longitude;
        self.lat = userLocation.coordinate.latitude;
        
//        guard let lon = lon, let lat = lat else { return }
//        weatherGetter.getWeatherDataFrom(lon: lon, lat: lat) { [weak self](success) in
//            if success {
//                DispatchQueue.main.async {
//                    self?.weatherForecastTableview.reloadData()
//                    self?.currentLocationLabel.text = "\(lon) and \(lat)"
//                    guard let temp = self?.weatherController.weatherList[0].main.temp else { return }
//                    self?.currentTempLabel.text = String(convertKelvintoFahrenheit(fahrenheit: temp))
//                }
//            }
//            else {
//                print("Debug")
//            }
//        }
//        
    }
}
