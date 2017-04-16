//
//  Model.swift
//  HackSherbrookeApp
//
//  Created by William Poole on 2017-03-11.
//  Copyright © 2017 William Poole. All rights reserved.
//

import Foundation

class Model {
    //Creating Singleton Model
    static let sharedInstance = Model()
    
    var recentArray = [FavoriteClass]()
    var favoriteArray = [FavoriteClass]()
    var favoriteVCIndex : Int?
    var switchNum = 0
    
    var arrayOfPubPark: [pubPark]?
    var arrayOfParkMeter: [PPlace]?
    var arrayOfEvent: [Event]?
    var arrayOfAnnotation: [PinAnnotation]?
    var arrayOfSigns: [parkSigns]?
    var arrayOfDistanceSearch: [DistanceSearch]?
    var arrayOfArt: [art]?
    var arrayOfCameras: [camera]?
    var arrayOfCammeraSearch: [CameraSearch]?
}
