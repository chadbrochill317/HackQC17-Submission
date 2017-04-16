//
//  PPlace.swift
//  gettingAPIJeremy
//
//  Created by Lucas McDonald on 2017-03-11.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
class PPlace : locationToMap
{
    var longe = Double()
    var lati = Double()
    var nameOfRoad = String()
    
    
    var sNoPlace = String()
    var nLongitude = Double() ///sign location
    var nLatitude = Double()
    var nPositionCentreLongitude = Double() ///center of the parking space
    var nPositionCentreLatitude = Double()
    var sType = String() // simple or double, if you can park both sides
    var sNomRue = String()
    var nSupVelo = Int() //if theres a place for putting your bike away
    var nTarifHoraire = Int() //tarif per hour 300 is like 3.00 per hour
    var sLocalisation = String() //S is for on road, H = off road (public parking
    var sGenre = String() // Normal, Handicapped and other are values
    var nTarifMax = String() // Max you can pay in day in cents
    init(sNoPlace : String,nLongitude: Double, nLatitude:  Double,nPositionCentreLongitude: Double,  nPositionCentreLatitude: Double,sType:String, sNomRue:String,nSupVelo:Int,nTarifHoraire:Int,sLocalisation:String,nTarifMax:String, sGenre:String)
    {
        self.sNoPlace  = sNoPlace
        self.nLongitude  = nLongitude
        self.nLatitude  = nLatitude
        self.nPositionCentreLongitude  = nPositionCentreLongitude
        self.nPositionCentreLatitude  = nPositionCentreLatitude
        self.sType  = sType
        self.sNomRue  = sNomRue
        self.nSupVelo  = nSupVelo
        self.sLocalisation  = sLocalisation
        self.nTarifMax  = nTarifMax
        self.sGenre = sGenre
        super.init(X: nLongitude, Y: nLatitude)
        
    }
    
    
}
