//
//  Region.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import Foundation
import RealmSwift

class Region: BaseObject {
    @objc dynamic var name = ""
//    let countries = List<Country>()
    let countries = LinkingObjects(fromType: Country.self, property: "region")
}
