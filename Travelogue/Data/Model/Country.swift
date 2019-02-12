//
//  Country.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import UIKit
import RealmSwift

class Country: BaseObject {
//    @objc dynamic var name = ""
    @objc dynamic var id = 0

    @objc dynamic var region: Region?
    let places = LinkingObjects(fromType: Place.self, property: "country")

//    override static func primaryKey() -> String? {
//        return "id"
//    }

}
