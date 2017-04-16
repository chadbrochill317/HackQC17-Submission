//
//  DetailController.swift
//  hackTest2
//
//  Created by Thomas jordan on 2017-03-11.
//  Copyright © 2017 Thomas jordan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Kingfisher

class DetailController:  UIViewController, MKMapViewDelegate,  CLLocationManagerDelegate, UISearchBarDelegate  {
    
    
    class Annotation: NSObject, MKAnnotation
    {
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        var title: String?
        var URL: String?
        var image: UIImage?
        var custom_image: Bool = true
        var color: MKPinAnnotationColor = MKPinAnnotationColor.purple
    }
    
    
    
    let singletonModel = Model.sharedInstance
    var distanceSearch = DistanceSearch()
    var parkingNameSearch = ParkingNameSearch()
    var cameraDistanceSearch = CameraSearch()
    
    @IBOutlet weak var streetCam: UIImageView!
    
    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    var lastSearchLatitude = double_t()
    var lastSearchLongitude = double_t ()
    var lastSearchName = String()
    
    @IBOutlet weak var favoriteButtonOutlet: UIBarButtonItem!
    
    @IBAction func showSearchBar(_ sender: AnyObject) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        let favorite = FavoriteClass(name: lastSearchName, longitude: lastSearchLongitude, latitude: lastSearchLatitude)
        singletonModel.favoriteArray.append(favorite)
        favoriteButtonOutlet.isEnabled = false

    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        favoriteButtonOutlet.isEnabled = false
        var dataPullPuller = dataPull()
        mapView.showsUserLocation = true
        mapView.delegate = self
        

        
        var n = 0
        while ((singletonModel.arrayOfCameras?.count)! > n + 414){//singletonModel.arrayOfCameras?.count)! > n + 400
            let annotation = Annotation()
            annotation.coordinate.latitude = (singletonModel.arrayOfCameras?[n].Lati)!
            annotation.coordinate.longitude = (singletonModel.arrayOfCameras?[n].Long)!
            let url = URL(string: (singletonModel.arrayOfCameras?[n].urlDirect)!)
            let data = try? Data(contentsOf: url!)
            annotation.URL = singletonModel.arrayOfCameras?[n].urlDirect
            annotation.custom_image = (UIImage(data: data!) != nil)
            annotation.image = (UIImage(data: data!))
//            //print(annotation.image)
//            //print(annotation.URL)
//            //print(data)
            annotation.color = MKPinAnnotationColor.purple
            annotation.title = singletonModel.arrayOfCameras?[n].Title
            mapView.addAnnotation(annotation)

            n += 1
        }

        
    }
    
    
    func getImageData(Address: String) -> UIImage
    {
        var imageToSend = UIImage()
        
        if let urlToUse = URL(string: Address)
        {
            if let dataToUse = try? Data(contentsOf: urlToUse)
            {
                let jsonData = UIImage(data: dataToUse);
                
                var imageToSend = UIImage(data: dataToUse)
                print(imageToSend);
                
                
            }
            
        }
        return imageToSend;
        
    }
    
    
    func mapView(mapView:  MKMapView, didSelect: Annotation){
        print("didSelect")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is Annotation){
            return nil
        }
        //print("This Works")
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }

        let restaurantAnnotation = annotation as! Annotation
        

       var clone = getImageData(Address: restaurantAnnotation.URL!)
        print(clone)
        //let ImageView.kf.setImage(with: url)
        
        annotationView?.detailCalloutAccessoryView = UIImageView(image: clone)
        
        // Left Accessory
        let leftAccessory = UILabel(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
        leftAccessory.text = ""
        leftAccessory.font = UIFont(name: "Verdana", size: 10)
        leftAccessory.numberOfLines = 0
        annotationView?.leftCalloutAccessoryView = leftAccessory
        
         //Right accessory view
        //let url = URL(string: restaurantAnnotation.URL!)
        //let data = try? Data(contentsOf: url! as URL)
        //print(data)
        //let image = UIImage(data: data!)
        //print(restaurantAnnotation.URL)
        
        //let image = clone
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(clone, for: UIControlState())
        annotationView?.rightCalloutAccessoryView = button

        var dam = self.view.subviews[0] as! UIImageView
        streetCam.image = UIImageView(string: "http://www1.ville.montreal.qc.ca/Circulation-Cameras/GEN6.jpeg")
        
        
        
        
        return annotationView
    }
    
    func mapView(mapView:  MKMapView, annotationView: Annotation, calloutAccessoryControlTapped: UIControl){
        print("calloutAccessory")
    }
    
    func mapView(mapView:  MKMapView, didAdd: Annotation){
        print("didAdd")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        var n = 0
        var arrayPB = singletonModel.arrayOfPubPark!
        
        
        singletonModel.arrayOfAnnotation = [PinAnnotation]()
        
        while (((singletonModel.arrayOfPubPark?.count)! - 1) > n){
            let annotation = MKPointAnnotation()
            var tempLat = double_t()
            var tempLong = double_t()
            tempLat = (singletonModel.arrayOfPubPark?[n].y)!
            tempLong = (singletonModel.arrayOfPubPark?[n].x)!
            let location = CLLocation(latitude: tempLat, longitude: tempLong)
            
            annotation.title = arrayPB[n].NOM
            
            
            singletonModel.arrayOfAnnotation?.append(PinAnnotation(coordinate: CLLocationCoordinate2D(latitude: (singletonModel.arrayOfPubPark?[n].y)!, longitude: (singletonModel.arrayOfPubPark?[n].x)!)))
            
            singletonModel.arrayOfAnnotation?[n].title = annotation.title
            
            
            
            
            self.mapView.addAnnotation((singletonModel.arrayOfAnnotation?[n])!)
            n += 1
            
            
        }
        n = 0
        while ((singletonModel.arrayOfParkMeter?.count)! > n){
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: (singletonModel.arrayOfParkMeter?[n].nLatitude)!, longitude: (singletonModel.arrayOfParkMeter?[n].nLongitude)!)
            annotation.title = singletonModel.arrayOfParkMeter?[n].sNomRue
            self.mapView.addAnnotation(annotation)
            n += 1
            
        }
        n = 0
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        let dSearch = DistanceSearch().nearestToUserLocation(by: locationManager.location!, array: singletonModel.arrayOfParkMeter!, array2: singletonModel.arrayOfSigns!)
        //  var searchArray = any()
        //searchArray: Array<Any> =
        
        if (singletonModel.favoriteVCIndex != nil){
            let newLatitude = singletonModel.favoriteArray[singletonModel.favoriteVCIndex!].latitude
            let newLongitude = singletonModel.favoriteArray[singletonModel.favoriteVCIndex!].longitude
            let lanDelta: CLLocationDegrees = 0.05
            let lonDelta: CLLocationDegrees = 0.05
            let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
            let coordinates = CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)
            let region = MKCoordinateRegion(center: coordinates, span: span)
            // mapView.setRegion(region, animated: true)
            favoriteButtonOutlet.isEnabled = false
            
            let getLat: CLLocationDegrees = newLatitude
            let getLon: CLLocationDegrees = newLongitude
            let location: CLLocation =  CLLocation(latitude: getLat, longitude: getLon)
            locationDetails(location: location)
        }
    }
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.lastSearchName = searchBar.text!
            self.lastSearchLatitude = localSearchResponse!.boundingRegion.center.latitude
            self.lastSearchLongitude = localSearchResponse!.boundingRegion.center.longitude
            self.favoriteButtonOutlet.isEnabled = true
            
            let recent = FavoriteClass(name: self.lastSearchName, longitude: self.lastSearchLongitude, latitude: self.lastSearchLatitude)
            self.singletonModel.recentArray.append(recent)
            
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            
            let getLat: CLLocationDegrees = self.lastSearchLatitude
            let getLon: CLLocationDegrees = self.lastSearchLongitude
            let location: CLLocation =  CLLocation(latitude: getLat, longitude: getLon)
            self.locationDetails(location: location)
        }
    }
    
    
    
    
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: (error)")
        
    }
    
    func locationDetails(location: CLLocation){
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
            } else {
                if let placemark = placemarks?[0] {
                    var address = ""
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                    }
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                    }
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    if placemark.country != nil {
                        address += placemark.country! + "\n"
                    }
                    
                    let newLatitude = location.coordinate.latitude
                    let newLongitude = location.coordinate.longitude
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)
                    annotation.title = address
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





















