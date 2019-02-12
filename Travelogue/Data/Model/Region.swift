//
//  Region.swift
//  Travelogue
//
//  Created by Dubey, Josh (UK - London) on 23/01/2018.
//  Copyright © 2018 Josh Dubey. All rights reserved.
//

import Foundation
import RealmSwift

enum RegionName: String {
    case africa = "Africa"
    case europe = "Europe"
}

class Region: BaseObject {

    static let imageDict: [RegionName: UIImage] = [.africa: Asset.afica.image, .europe: Asset.europe.image]
//    @objc dynamic var name = ""
    @objc dynamic var id = 0
    let countries = LinkingObjects(fromType: Country.self, property: "region")

//    override static func primaryKey() -> String? {
//        return "id"
//    }
}
