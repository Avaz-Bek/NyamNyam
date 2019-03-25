//
//  VacationDestination.swift
//  NyamNyam
//
//  Created by Avazbek Kodiraliev on 3/24/19.
//  Copyright © 2019 Atay Sultangaziev. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {

    let name:String
    let latitude:CLLocationDegrees
    let longitude:CLLocationDegrees
    let location:CLLocationCoordinate2D
 
    init(name:String,latitude:CLLocationDegrees,longtitude:CLLocationDegrees,location:CLLocationCoordinate2D) {
        self.name = "Ktu Manas, Fakul'tet Inzhenerii"
        self.latitude = 42.833870
        self.longitude = 74.576764
        self.location = location
        
    }
}
