//
//  parkMeter.swift
//  parkingLot
//
//  Created by Lucas McDonald on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
class parkMeter : locationToMap {
    var parkMeterID : String
    var maxTime: String
    var pIDG: String
    var methodTagID: String
    init(parkMeterID: String, X: Double, Y: Double, maxTime: String, methodTagID: String, pIDG:String)
    {
        self.parkMeterID = parkMeterID
        self.maxTime = maxTime;
        self.methodTagID = methodTagID;
        self.pIDG = pIDG
        super.init(X: X, Y: Y)

    }
 
    
}
