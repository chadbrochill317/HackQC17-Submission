//
//  DistanceSearch.swift
//  gettingAPIJeremy
//
//  Created by Sam Kent on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftyJSON

class DistanceSearch : NSObject {
    override init() {
        super.init();
    }
    public func nearestToUserLocation(by userLocation: CLLocation, array: Array<PPlace>, array2: Array<parkSigns>) -> Array<Any> {
        var ppArray = array;
        var pkArray = array2;

        
        var currentLocation: CLLocation? = userLocation
        var count1: Int = ppArray.count
        var count2: Int = pkArray.count
        
        var final = Array<Any> ()
        
        var baseLat1 = userLocation.coordinate.latitude
        var baseLong1 = userLocation.coordinate.latitude
        
        while count1 != 0 {
            let testLat1 = (ppArray[count1 - 1].nLatitude)
            let testLong1 = (ppArray[count1 - 1].nLongitude)
            
            let location1 = CLLocation(latitude: testLat1, longitude: testLong1)
            let distanceInMeters = userLocation.distance(from: location1);
            
            if distanceInMeters < 1000 {
                let toAppend1 = (ppArray[count1])
                final.append(toAppend1)
                count1 = count1 - 1
            }else {
                count1 = count1 - 1
            }
        }
        while count2 != 0 {
            let testLat2 = (pkArray[count2 - 1].lati)
            let testLong2 = (pkArray[count2 - 1].longe)
            
            let location2 = CLLocation(latitude: testLat2, longitude: testLong2)
            let distanceInMeters2 = userLocation.distance(from: location2)
            
            if distanceInMeters2 < 1000 {
                let toAppend2 = (pkArray[count2])
                final.append(toAppend2)
                count2 = count2 - 1
            }else {
                count2 = count2 - 1
            }
        }
    return final
    }
}
