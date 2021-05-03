//
//  Pettion.swift
//  project 7
//
//  Created by Павел Тимофеев on 24.04.2021.
//

import Foundation

struct Petition: Codable { // for load from JSON
    var title: String
    var body: String
    var signatureCount: Int
}
