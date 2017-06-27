//
//  Location.swift
//  RainyShinyCloudyRedo
//
//  Created by Nam Phung on 6/27/17.
//  Copyright © 2017 Nam Phung. All rights reserved.
//

import UIKit
import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    var latitude: Double!
    var longtitude: Double!
    
    private init() {
        
    }
}
