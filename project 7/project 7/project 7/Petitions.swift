//
//  Petitions.swift
//  project 7
//
//  Created by Павел Тимофеев on 24.04.2021.
//

import Foundation


struct  Petitions: Codable { // result it a dictionary in JSON. We should load "results" KEY to be inside in array load a result of request
    var results: [Petition]
}
