//
//  Person.swift
//  project 10
//
//  Created by Павел Тимофеев on 13.05.2021.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
