//
//  parkSigns.swift
//  gettingAPIJeremy
//
//  Created by Lucas McDonald on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
class parkSigns: locationToMap
{
    
    var longe: Double
    var lati: Double
    var description: String
    init(x: Double,y: Double, longe: Double, lati: Double, desc: String)
    {
        description = desc
        self.lati = lati;
        self.longe = longe;
        
        
        
        super.init(X: x, Y: y)
        
        
    }
    
    
    
}
