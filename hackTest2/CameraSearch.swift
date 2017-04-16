//
//  CameraSearch.swift
//  gettingAPIJeremy
//
//  Created by Sam Kent on 2017-03-12.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CameraSearch : NSObject {
    func cameraClosestToUser(by userLocation: CLLocation, array: Array<camera>) -> Array<Any> {
        var objects = array
        
        var currentLocation: CLLocation? = userLocation
        
        var count = array.count
        
        var final = Array<Any>()
        
        var baseLat = userLocation.coordinate.latitude
        var baseLong = userLocation.coordinate.longitude
        
        while count != 0 {
            let testLat = (objects[count - 1].Lati)
            let testLong = (objects[count - 1].Long)
            
            let location = CLLocation(latitude: testLat, longitude: testLong)
            
            let distanceInMeters = userLocation.distance(from: location)
            
            if distanceInMeters < 1000 {
                var toAppend = (array[count])
                final.append(toAppend)
                count = count - 1
            }else {
                count = count - 1
            }
        }
        return final
}
}
