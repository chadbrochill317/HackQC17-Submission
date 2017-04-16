//
//  Event.swift
//  parkingLot
//
//  Created by Lucas McDonald on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
class Event{
    
    
    init(MUNID: Int,CODEID : Int,DT01 : String,DT02 : String,Title : String, Categ: String,Location : String,Descrip: String,URL_PHOTO: String)
    {
        self.MUNID = MUNID
        self.CODEID = CODEID
        self.DT01 = DT01
        self.DT02 = DT02
        self.Title = Title
        self.Categ = Categ
        self.Location = Location
        self.Descrip = Descrip;
        self.URL_PHOTO = URL_PHOTO;
        
        
        
        
    }
    var MUNID : Int
    var CODEID : Int
    var DT01 : String //start date
    var DT02 : String //end date
    var Title : String
    var Categ : String
    var Location : String
    var Descrip: String
    var URL_PHOTO: String

    
    
    
    
    
}
