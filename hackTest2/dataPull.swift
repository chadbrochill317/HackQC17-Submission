//
//  dataPull.swift
//  parkingLot
//
//  Created by Lucas McDonald on 2017-03-10.
//  Copyright © 2017 Lucas McDonald. All rights reserved.
//

import Foundation
import SwiftyJSON
import CSVImporter

class dataPull
{
    
    init()
    {
        let currModel = Model.sharedInstance
        
        currModel.arrayOfCameras = getThatFunkyCameraData()
        currModel.arrayOfArt = getArtData()
        currModel.arrayOfSigns = getParkingSignData()
        currModel.arrayOfParkMeter = getParkingPlaces()
        currModel.arrayOfPubPark = getPubParkData(Address: "https://www.donneesquebec.ca/recherche/dataset/307b8aa0-1d5f-494d-aabf-01540f870c40/resource/d9cf4c66-9622-421b-a6c8-198fbfaeadbb/download/stationnementpublic.json")
        
        
        
        
    }
    func getParkingSignData() -> [parkSigns]
    {
        var featureArray = [parkSigns]()
        
        
        if let path = Bundle.main.path(forResource:"signsSlimmed", ofType: "json")
        {
            
            if let data = NSData(contentsOfMappedFile: path) {
                let jsonData = JSON(data: data as Data, options: JSONSerialization.ReadingOptions.allowFragments, error: nil)
                var index = 0;
                
                while(index<jsonData["features"].count)
                {
                    let pSToAdd = parkSigns(x: Double(jsonData["features"][index]["properties"]["X_EPSG32188"].stringValue)!, y: Double(jsonData["features"][index]["properties"]["Y_EPSG32188"].stringValue)!, longe: Double(jsonData["features"][index]["properties"]["Longitude"].stringValue)!, lati: Double(jsonData["features"][index]["properties"]["Latitude"].stringValue)!, desc: jsonData["features"][index]["properties"]["NOM_ARR"].stringValue)
                    index = index + 1;
                    featureArray.append(pSToAdd)
                }
                
                
                
            }
            
            
            
            
        }
        
        
        
        
        
        return featureArray
    }
    
    
    
    
    
    
    
    
    func getArtData() -> [art]
    {
        var featureArray = [art]()
        
        
        if let path = Bundle.main.path(forResource:"art", ofType: "json")
        {
            
            if let data = NSData(contentsOfMappedFile: path) {
                let jsonData = JSON(data: data as Data, options: JSONSerialization.ReadingOptions.allowFragments, error: nil)
                var index = 0;
                
                while(index<jsonData[index].count)
                {
                    
                    
                    var FirstName = jsonData[index]["Artistes"][0]["Nom"].stringValue
                    FirstName = FirstName + " " + jsonData[index]["Artistes"][0]["Prenom"].stringValue;
                    
                    let lat = Double(jsonData[index]["CoordonneeLatitude"].stringValue)
                    let lot = Double(jsonData[index]["CoordonneeLongitude"].stringValue)
                    
                    let artToAdd = art(Name: jsonData[index]["Titre"].stringValue, Author: FirstName, Long: lot!, Lati: lat!)
                    
                    
                    index = index + 1;
                    featureArray.append(artToAdd);
                }
                
                
                
            }
            
            
            
            
        }
        
        
        
        
        
        return featureArray
    }
    
    
    
    
    func getParkingPlaces() -> [PPlace]
    {
        var featureArray = [PPlace]()
        
        
        if let path = Bundle.main.path(forResource:"places", ofType: "json")
        {
            
            if let data = NSData(contentsOfMappedFile: path) {
                let jsonData = JSON(data: data as Data, options: JSONSerialization.ReadingOptions.allowFragments, error: nil)
                var index = 0;
                
                while(index < jsonData.count-1)
                {
                    
                    index=index+1;
                    
                    var toAdd = PPlace(sNoPlace: jsonData[index]["sNoPlace"].stringValue, nLongitude: Double(jsonData[index]["nLongitude"].stringValue)!, nLatitude: Double(jsonData[index]["nLatitude"].stringValue)!, nPositionCentreLongitude: Double(jsonData[index]["nPositionCentreLongitude"].stringValue)!, nPositionCentreLatitude: Double(jsonData[index]["nPositionCentreLatitude"].stringValue)!, sType: jsonData[index]["sType"].stringValue, sNomRue: jsonData[index]["sNomRue"].stringValue, nSupVelo: Int(jsonData[index]["nSupVelo"].stringValue)!, nTarifHoraire: Int(jsonData[index]["nTarifHoraire"].stringValue)!, sLocalisation: jsonData[index]["sLocalisation"].stringValue, nTarifMax: jsonData[index]["nTarifMax"].stringValue,sGenre:jsonData[index]["sGenre"].stringValue )
                    
                    
                    
                    featureArray.append(toAdd)
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        
        return featureArray
    }
    
    
    
    func getThatFunkyCameraData() -> [camera]
    {
        var featureArray = [camera]()
        
        
        if let path = Bundle.main.path(forResource:"camerasJSON", ofType: "json")
        {
            
            if let data = NSData(contentsOfMappedFile: path) {
                let jsonData = JSON(data: data as Data, options: JSONSerialization.ReadingOptions.allowFragments, error: nil)
                var index = 0;
                while(index < jsonData.count-1)
                {
                    
                    var ID = jsonData[index]["nid"].stringValue
                    var URL = jsonData[index]["url"].stringValue
                    var Title = jsonData[index]["titre"].stringValue
                    var Lati = Double(jsonData[index]["latitude"].stringValue)
                    var Long = Double(jsonData[index]["longitude"].stringValue)
                    
                    var toAdd = camera(ID: ID, Lati: Lati!, Long: Long!, Title: Title, urlDirect: URL)
                    featureArray.append(toAdd)
                    index=index+1;
                }
                
                
                
            }
            
            
            
            
        }

        return featureArray
        
    }
    
    
    
    
    func getPubParkData(Address: String) -> [pubPark]
    {
        var featureArray = [pubPark]()
        
        if let urlToUse = URL(string: Address)
        {
            if let dataToUse = try? Data(contentsOf: urlToUse)
            {
                let jsonData = JSON(data: dataToUse);
                
                
                for index in 0 ... jsonData["features"].count - 1
                {
                    
                    
                    var fToAdd = pubPark(Nom:jsonData["features"][index]["properties"]["NOM"].stringValue, X:Double(jsonData["features"][index]["properties"]["x"].stringValue)!, Y:Double(jsonData["features"][index]["properties"]["y"].stringValue)!)
                    
                    featureArray.append(fToAdd)
                    
                    
                    
                    
                    
                }
                
            }
            
            
        }
        
        
        return featureArray
        
    }
    
    
    
    
    
    
    
    
    
}







