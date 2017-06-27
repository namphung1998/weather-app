//
//  CurrentWeather.swift
//  RainyShinyCloudyRedo
//
//  Created by Nam Phung on 6/27/17.
//  Copyright © 2017 Nam Phung. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
    
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire Download
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self.cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self.weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let temp = main["temp"] as? Double {
                        
                        let kelvinToFarenheitPreDivision = (temp * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        
                        print(self.currentTemp)
                    }
                }
            }
            completed()
        }
    }
}
