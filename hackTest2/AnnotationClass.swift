//
//  AnnotationClass.swift
//  HackSherbrookeApp
//
//  Created by William Poole on 2017-03-11.
//  Copyright © 2017 William Poole. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var image: UIImage?
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
