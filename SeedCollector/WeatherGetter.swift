//
//  WeatherGetter.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/27/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

protocol WeatherGetterDelegate
{
    func didGetWeather(weather: Weather)
    func didNotGetWeather(error: NSError)
}

class WeatherGetter
{
    typealias CompletionHandler = (Error?) -> Void
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "7d4d100680ea18d191eaa322d76a72d1"
    
    func getWeather(city: String, completion: @escaping CompletionHandler = { _ in })
    {
        
        // This is a pretty simple networking task, so the shared session will do.
        //let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
        
        // The data task retrieves the data.
        URLSession.shared.dataTask(with: weatherRequestURL) { (data, _, error) in
            if let error = error
            {
                NSLog("Error fetching tasks: \(error)")
                completion(error)
                return
            }
            else
            {
                print("Data: \(data!)")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(dataString!)")
                
                do {
                    // Try to convert that data into a Swift dictionary
                    let weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.
                    // Let's print its contents to the debug console.
                    print("Date and time: \(weather["dt"]!)")
                    print("City: \(weather["name"]!)")
                    
                    print("Longitude: \(weather["coord"]!["lon"]!!)")
                    print("Latitude: \(weather["coord"]!["lat"]!!)")
                    
//                    print("Weather ID: \(weather["weather"]![0]?["id"]!!)")
//                    print("Weather main: \(weather["weather"]![0]!["main"]!!)")
//                    print("Weather description: \(weather["weather"]![0]!["description"]!!)")
//                    print("Weather icon ID: \(weather["weather"]![0]!["icon"]!!)")
                    
                    print("Temperature: \(weather["main"]!["temp"]!!)")
                    print("Humidity: \(weather["main"]!["humidity"]!!)")
                    print("Pressure: \(weather["main"]!["pressure"]!!)")
                    
                    print("Cloud cover: \(weather["clouds"]!["all"]!!)")
                    
//                    print("Wind direction: \(weather["wind"]!["deg"]!!) degrees")
                    print("Wind speed: \(weather["wind"]!["speed"]!!)")
                    
                    print("Country: \(weather["sys"]!["country"]!!)")
                    print("Sunrise: \(weather["sys"]!["sunrise"]!!)")
                    print("Sunset: \(weather["sys"]!["sunset"]!!)")
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }
            }
        }
//            guard let data = data else
//            {
//                NSLog("No data returned by data task")
//                completion(NSError())
//                return
//            }
        
        // The data task is set up...launch it!
        .resume()
    }
}
