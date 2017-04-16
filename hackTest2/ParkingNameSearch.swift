//
//  ParkingNameSearch.swift
//  gettingAPIJeremy
//
//  Created by Sam Kent on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import MapKit

class ParkingNameSearch: NSObject {
    func searchParkingName(by name: String, array: Array<PPlace>, array2: Array<parkSigns>) -> Array<Any> {
        var ppArray = array;
        var pkArray = array2;
        var final = Array<Any> ()
        
        let filteredPPArray = array.filter { ppArray in return (ppArray as! PPlace).sGenre.lowercased().contains(name)}
        let filteredPKArray = array2.filter({$0.description == name})
        
        if array.count > array2.count {
            for var i in (0..<array.count-1) {
                final.append(array[i])
                final.append(array2[i])
            }}else{
                for var i in (0..<array2.count-1) {
                    final.append(array2[i])
                    final.append(array[i])
                }
            }
        return final
    }
}
    
    func searchParkingPrice(by name:Int, array: Array<PPlace>) -> Array<Any> {
        var ppArray = array
        var final = Array<Any> ()
        
        let filteredPPArray = array.filter({$0.nTarifHoraire <= name})
        
        for var i in (0..<array.count-1){
            final.append(array[i])
        }
        
        return final
}

