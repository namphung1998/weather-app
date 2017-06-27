//
//  Constants.swift
//  RainyShinyCloudyRedo
//
//  Created by Nam Phung on 6/27/17.
//  Copyright © 2017 Nam Phung. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "03c500a01a5cfa15aa7fe40c925accfd"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGTITUDE)\(Location.sharedInstance.longtitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longtitude!)&cnt=10&appid=03c500a01a5cfa15aa7fe40c925accfd"


typealias DownloadComplete = () -> ()
