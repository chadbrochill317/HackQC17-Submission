//
//  ParkingMeterClass.swift
//  HackSherbrookeApp
//
//  Created by William Poole on 2017-03-10.
//  Copyright © 2017 William Poole. All rights reserved.
//

import Foundation

class ParkingClass {
    
    var id = Int()
    var longitude = double_t()
    var latitude = double_t()
    
    init(id: Int, longitude: double_t, latitude: double_t){
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
    }
}
