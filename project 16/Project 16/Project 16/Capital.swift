//
//  Capital.swift
//  Project 16
//
//  Created by Павел Тимофеев on 12.07.2021.
//
import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wikipediaUrl: String


    init(title: String,
         coordinate: CLLocationCoordinate2D,
         info: String,
         wikipediaUrl: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wikipediaUrl = wikipediaUrl
    }
}

