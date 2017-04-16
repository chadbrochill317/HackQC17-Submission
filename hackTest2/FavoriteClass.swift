//
//  FavoriteClass.swift
//  HackSherbrookeApp
//
//  Created by William Poole on 2017-03-11.
//  Copyright © 2017 William Poole. All rights reserved.
//

import Foundation

class FavoriteClass {
    
    var name = String()
    var longitude = double_t()
    var latitude = double_t()
    
    init(name: String, longitude: double_t, latitude: double_t){
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
    }
}
