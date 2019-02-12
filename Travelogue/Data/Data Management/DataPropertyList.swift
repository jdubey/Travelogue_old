//
//  DataPropertyList.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import Foundation

class DataPropertyList: Codable {
    var summary: [[String: String]]
}

class AppPropertyList: Codable {
    var regions: [RegionList]
}

class PlaceList: Codable {
    var places: [String]
}

class CountryList: Codable {
    var name: String
    var places: [String]
}

class RegionList: Codable {
    var name: String
    var countries: [CountryList]
}
