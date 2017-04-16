//
//  FavoriteController.swift
//  hackTest2
//
//  Created by Thomas jordan on 2017-03-11.
//  Copyright © 2017 Thomas jordan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FavoriteController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate,  CLLocationManagerDelegate{
    let singletonModel = Model.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
                if(singletonModel.switchNum == 0){
                return singletonModel.favoriteArray.count
            }
                else {
                    return singletonModel.recentArray.count
                }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        singletonModel.favoriteVCIndex = indexPath.section
        //self.performSegue(withIdentifier: "detailPark", sender: self)

        func openMapForPlace() {
            let latitude: CLLocationDegrees = singletonModel.favoriteArray[indexPath.section].latitude
            let longitude: CLLocationDegrees = singletonModel.favoriteArray[indexPath.section].longitude
        
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = singletonModel.favoriteArray[indexPath.section].name
            mapItem.openInMaps(launchOptions: options)
        }
        openMapForPlace()
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCell", for: indexPath)
        let section = indexPath.section
        if(singletonModel.switchNum == 0){
        cell.textLabel?.text = singletonModel.favoriteArray[section].name        }
        else {
        cell.textLabel?.text = singletonModel.recentArray[section].name        }
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.darkGray.withAlphaComponent(0.40)
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.gray.withAlphaComponent(1.0).cgColor
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        
        
        
        cell.layer.masksToBounds = true
        //
        return cell

    }
    



}
